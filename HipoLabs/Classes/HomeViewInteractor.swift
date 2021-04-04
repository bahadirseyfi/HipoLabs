//
//  HomeViewInteractor.swift
//  HipoLabs
//
//  Created by bahadir on 30.03.2021.
//

import Foundation

class HomeViewInteractor {

    private var membersModel: MembersModel?
    var members: [Member] = []
    var filtered_members: [Member] = []

    func membersArray(completion: (()->Void)?){
        membersModel = Service.shared.loadJSON(fileName: "hipo")
        if let fetchMember = membersModel?.members {
            self.members = fetchMember
            self.filtered_members = members
        }
    }
    
    func filterArray(by text: String?, completion: (()->Void)?){
        
        guard let text = text?.lowercased(), !text.isEmpty else {
            filtered_members = members
            completion?()
            return
        }
        filtered_members = members.filter({ $0.name?.lowercased().contains(text) ?? false})
        completion?()
    }
    
}
