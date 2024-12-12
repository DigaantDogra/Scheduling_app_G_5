//
//  TestViewModel.swift
//  Scheduling_app_G_5
//
//  Created by Digaant Dogra on 2024-12-10.
//

import Foundation
import Firebase
import CryptoKit

class TestViewModel:ObservableObject{
    @Published var companies:[Company] = []
    @Published var employers:[Employer] = []
    
    init() {
        fetchEmployer()
    }
    
    func fetchEmployer() {
        companies.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("Users")
        
        ref.getDocuments { snapshot, error in
            guard error == nil else {
                print("Error fetching Users documents: \(error!.localizedDescription)")
                return
            }
            
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    
                    let empID = data["empID"] as? Int ?? 1
                    let empName = data["empName"] as? String ?? ""
                    
                    if let companyRef = data["company"] as? DocumentReference {
                        companyRef.getDocument { (companySnapshot, error) in
                            guard let companyData = companySnapshot?.data(), error == nil else {
                                print("Error fetching Company document: \(error?.localizedDescription ?? "No data")")
                                return
                            }
                            
                            // Extract company data
                            let companyName = companyData["compName"] as? String ?? "Unknown"
                            let companyID = companyData["compID"] as? Int ?? 0
                            
                            // Create Employer with resolved company data
                            let employer = Employer(
                                email: "OK",
                                password: "okok",
                                empName: empName,
                                empID: empID,
                                company: Company(
                                    companyName: companyName,
                                    companyID: companyID
                                )
                            )
                            
                            // Append to employers on the main thread
//                            DispatchQueue.main.async {
                                self.employers.append(employer)
//                            }
                        }
                    }
                    
                    
                    
                }
            }
        }
    }

    
    func fetchUser(for email:String){
        
    }
    
    func addEmployer(for emp:Employer){
        let db = Firestore.firestore()
        let companyRef = db.collection("Company").document("Comp3")
        
        let ref = db.collection("Users").document(emp.email)
        ref.setData([
            "company":companyRef,
            "empID":emp.empID,
            "empName":emp.empName,
            "password":emp.password
        ]){error in
            if let error = error{
                print(error.localizedDescription)
            }
        }
    }
    
    func addCompany(companyName: String){
        let db = Firestore.firestore()
        let ref = db.collection("Company").document(companyName)
        ref.setData(["companyName":companyName,"companyID":10]){error in
            if let error = error{
                print(error.localizedDescription)
            }
        }
    }
    
    
    func hashString(_ input: String) -> String {
        let inputData = Data(input.utf8)
        let hashed = SHA256.hash(data: inputData)
        return hashed.compactMap { String(format: "%02x", $0) }.joined()
    }
    
    
}
