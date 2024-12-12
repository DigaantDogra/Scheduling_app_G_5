//
//  WelcomeViewModel.swift
//  Scheduling_app_G_5
//
//  Created by Digaant Dogra on 2024-12-11.
//

import Foundation
import Firebase
import FirebaseAuth
import CryptoKit

class WelcomeViewModel:ObservableObject{
    
    func login(for email: String, password: String, completion: @escaping (User?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Error signing in: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            let dispatchGroup = DispatchGroup()
            var fetchedUser: User? = nil
            
            // Fetch Employer
            dispatchGroup.enter()
            self.getEmployer(for: email, password: password) { employer in
                if let employer = employer {
                    fetchedUser = employer
                }
                dispatchGroup.leave()
            }
            
            // Fetch Manager
            dispatchGroup.enter()
            self.getManager(for: email, password: password) { manager in
                if let manager = manager {
                    fetchedUser = manager
                }
                dispatchGroup.leave()
            }
            
            // Fetch Associate
            dispatchGroup.enter()
            self.getAssociate(for: email, password: password) { associate in
                if let associate = associate {
                    fetchedUser = associate
                }
                dispatchGroup.leave()
            }
            
            // Notify when all calls complete
            dispatchGroup.notify(queue: .main) {
                if let user = fetchedUser {
                    print("\(type(of: user)) fetched successfully.")
                    completion(user)
                } else {
                    print("Failed to fetch any user type.")
                    completion(nil)
                }
            }
        }
    }

    
    private func getAssociate(for email: String, password: String, completion: @escaping (Associate?) -> Void) {
        let db = Firestore.firestore()
        let refAssociate = db.collection("Associates").document(email)
        
        refAssociate.getDocument { (document, error) in
            if let error = error {
                print("Error getting document: \(error)")
                completion(nil)
                return
            }
            
            guard let document = document, document.exists else {
                print("Document does not exist")
                completion(nil)
                return
            }
            
            guard let data = document.data() else {
                print("Error fetching document data")
                completion(nil)
                return
            }
            
            let associateID = data["associateID"] as? Int ?? 1
            let associateName = data["associateName"] as? String ?? ""
            
            if let companyRef = data["company"] as? DocumentReference {
                companyRef.getDocument { (companySnapshot, error) in
                    guard let companyData = companySnapshot?.data(), error == nil else {
                        print("Error fetching Company document: \(error?.localizedDescription ?? "No data")")
                        completion(nil)
                        return
                    }
                    
                    let companyName = companyData["compName"] as? String ?? "Unknown"
                    let companyID = companyData["compID"] as? Int ?? 0
                    
                    let dispatchGroup = DispatchGroup()
                    var associateAvaliability: [Avaliability] = []
                    var associateSchedule: [Schedule] = []
                    
                    // Fetch Avaliability
                    dispatchGroup.enter()
                    refAssociate.collection("Avaliability").getDocuments { snapshot, error in
                        defer { dispatchGroup.leave() }
                        guard let snapshot = snapshot, error == nil else {
                            print("Error fetching Avaliability documents: \(error?.localizedDescription ?? "No data")")
                            return
                        }
                        
                        for document in snapshot.documents {
                            let snapID = document.documentID
                            let data = document.data()
                            
                            let weekday = self.weekday(for: snapID)
                            
                            let endTimeA = data["endTime"] as? String ?? ""
                            let isAvaliable = data["isAvaliable"] as? Bool ?? false
                            let startTimeA = data["startTime"] as? String ?? ""
                            
                            let dateFormatter = DateFormatter()
                            dateFormatter.dateFormat = "HHmm"
                            guard let startTime = dateFormatter.date(from: startTimeA),let endTime = dateFormatter.date(from: endTimeA) else {
                                print("Invalid date format")
                                return
                            }
                            
                            
                            associateAvaliability.append(Avaliability(
                                startTime: startTime,
                                endTime: endTime,
                                weekDay: weekday,
                                isAvaliable: isAvaliable
                            ))
                        }
                    }
                    
                    // Fetch Schedule
                    dispatchGroup.enter()
                    refAssociate.collection("Schedule").getDocuments { snapshot, error in
                        defer { dispatchGroup.leave() }
                        guard let snapshot = snapshot, error == nil else {
                            print("Error fetching Schedule documents: \(error?.localizedDescription ?? "No data")")
                            return
                        }
                        
                        for document in snapshot.documents {
                            let snapID = document.documentID
                            let data = document.data()
                            
                            let endTimeS = data["endTime"] as? String ?? ""
                            let isScheduled = data["isScheduled"] as? Bool ?? false
                            let startTimeS = data["startTime"] as? String ?? ""
                            let shiftHours = data["shiftHours"] as? Int ?? 0
                            
                            let dateFormatter = DateFormatter()
                            dateFormatter.dateFormat = "HHmm"
                            guard let startTime = dateFormatter.date(from: startTimeS),let endTime = dateFormatter.date(from: endTimeS) else {
                                print("Invalid date format")
                                return
                            }
                            dateFormatter.dateFormat = "dd-MM-yyyy"
                            guard let workTime = dateFormatter.date(from: snapID) else {
                                print("Invalid date format")
                                return
                            }
                            
                            associateSchedule.append(Schedule(
                                workDate: workTime,
                                startTime: startTime,
                                endTime: endTime,
                                shiftHours: shiftHours,
                                isScheduled: isScheduled
                            ))
                        }
                    }
                    
                    // Completion handler when all data is ready
                    dispatchGroup.notify(queue: .main) {
                        let associate = Associate(
                            email: email,
                            password: password,
                            associateName: associateName,
                            associateID: associateID,
                            company: Company(companyName: companyName, companyID: companyID),
                            associateSchedule: associateSchedule,
                            associateAvaliability: associateAvaliability
                        )
                        completion(associate)
                    }
                }
            } else {
                print("No company reference found")
                completion(nil)
            }
        }
    }

    
    private func getEmployer(for email: String, password: String, completion: @escaping (Employer?) -> Void) {
        let db = Firestore.firestore()
        let refEmp = db.collection("Employers").document(email)
        
        refEmp.getDocument { (document, error) in
            if let error = error {
                print("Error getting document: \(error)")
                completion(nil) // Pass nil on error
                return
            }
            
            guard let document = document, document.exists else {
                print("Document does not exist")
                completion(nil) // Pass nil if document doesn't exist
                return
            }
            
            guard let data = document.data() else {
                print("No data found in the document")
                completion(nil)
                return
            }
            
            // Extract fields
            let empID = data["empID"] as? Int ?? 1
            let empName = data["empName"] as? String ?? ""
            let companyName = data["compName"] as? String ?? "Unknown"
            let companyID = data["compID"] as? Int ?? 0
            
            // Create Employer object
            let employer = Employer(
                email: email,
                password: password,
                empName: empName,
                empID: empID,
                company: Company(companyName: companyName, companyID: companyID)
            )
            
            completion(employer) // Pass the Employer object to the completion handler
        }
    }

    
    private func getManager(for email: String, password: String, completion: @escaping (Manager?) -> Void) {
        let db = Firestore.firestore()
        let refManager = db.collection("Managers").document(email)
        
        refManager.getDocument { (document, error) in
            if let error = error {
                print("Error getting document: \(error)")
                completion(nil) // Return nil in case of error
                return
            }
            
            guard let document = document, document.exists else {
                print("Document does not exist")
                completion(nil) // Return nil if document does not exist
                return
            }
            
            guard let data = document.data() else {
                print("No data found in the document")
                completion(nil)
                return
            }
            
            // Extract fields
            let manID = data["empID"] as? Int ?? 1
            let manName = data["empName"] as? String ?? ""
            let companyName = data["compName"] as? String ?? "Unknown"
            let companyID = data["compID"] as? Int ?? 0
            
            // Create Manager object
            let manager = Manager(
                email: email,
                password: password,
                managerName: manName,
                managerID: manID,
                company: Company(companyName: companyName, companyID: companyID)
            )
            
            completion(manager) // Pass the Manager object to the completion handler
        }
    }

    
    private func weekday(for str:String)->WeekDays{
        var day = WeekDays.Monday
        switch(str){
        case WeekDays.Monday.rawValue:
            day = WeekDays.Monday
            break
        case WeekDays.Monday.rawValue:
            day = WeekDays.Monday
            break
        case WeekDays.Monday.rawValue:
            day = WeekDays.Monday
            break
        case WeekDays.Monday.rawValue:
            day = WeekDays.Monday
            break
        case WeekDays.Monday.rawValue:
            day = WeekDays.Monday
            break
        case WeekDays.Monday.rawValue:
            day = WeekDays.Monday
            break
        case WeekDays.Monday.rawValue:
            day = WeekDays.Monday
            break
        default: break
        }
        
        return day
    }
    
    func hashpassword(for password: String) -> String {
        let passwordData = Data(password.utf8)
        let hashed = SHA256.hash(data: passwordData)
        return hashed.compactMap { String(format: "%02x", $0) }.joined()
    }
    
    
}
