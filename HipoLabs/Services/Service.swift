//
//  Service.swift
//  HipoLabs
//
//  Created by bahadir on 30.03.2021.
//

import Foundation


class Service {
    
    static let shared: Service = Service()
    private init() {}
    
    func loadJSON(fileName: String) -> MembersModel? {
        
        let decoder = JSONDecoder()
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            fatalError("\(fileName) isimli dosya bulunamad─▒")
        }
        guard let data = try? Data(contentsOf: url) else  { return nil }
        let member = try? decoder.decode(MembersModel.self, from: data)
    
        return member
        
    }
}
