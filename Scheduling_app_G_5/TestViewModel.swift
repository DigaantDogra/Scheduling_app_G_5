//
//  TestViewModel.swift
//  Scheduling_app_G_5
//
//  Created by Digaant Dogra on 2024-12-10.
//

import Foundation
import Firebase

class TestViewModel:ObservableObject{
    @Published var companies:[Company] = []
    
    init() {
        fetchCompany()
    }
    
    func fetchCompany(){
        companies.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("Company")
        ref.getDocuments{ snapshot, error in
            guard error == nil else{
                print(error!.localizedDescription)
                return
            }
            
            if let snapshot = snapshot{
                for document in snapshot.documents{
                    let data = document.data()
                    
                    let compID = data["companyID"] as? String ?? ""
                    let compName = data["companyName"] as? String ?? ""
                    
                    let company = Company(companyName: compName, companyID: Int(compID) ?? 99)
                    self.companies.append(company)
                }
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
    
}
