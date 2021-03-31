//
//  Service.swift
//  HipoLabs
//
//  Created by bahadir on 30.03.2021.
//

import Foundation


class Service {
    
    static let shared: Service = Service()
    init() {}
    
    func loadJSON(fileName: String) -> MembersModel? {
        
        let decoder = JSONDecoder()
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            fatalError("\(fileName) isimli dosya bulunamadı")
        }
        guard let data = try? Data(contentsOf: url) else  { return nil }
        let member = try? decoder.decode(MembersModel.self, from: data)
        
        
   /*     guard
            let url = Bundle.main.url(forResource: fileName, withExtension: "json"),
            let data = try? Data(contentsOf: url),
            let member = try? decoder.decode(MembersModel.self, from: data)
     
            else {
                 return nil
        }
   */
        return member
    }
    
    
}
