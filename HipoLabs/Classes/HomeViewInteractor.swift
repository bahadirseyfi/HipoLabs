//
//  HomeViewInteractor.swift
//  HipoLabs
//
//  Created by bahadir on 30.03.2021.
//

import Foundation


class HomeViewInteractor {
    
    var membersModel: MembersModel?

   // var members: MembersModel = Service.service.loadJSON(fileName: "hipo")!
    
    func fetchModel(completion: (()->Void)?){
       
        membersModel = Service.shared.loadJSON(fileName: "hipo")
        
    }
}
