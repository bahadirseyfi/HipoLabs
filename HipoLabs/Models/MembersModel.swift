//
//  MembersModel.swift
//  HipoLabs
//
//  Created by bahadir on 29.03.2021.
//



class MembersModel: Codable {
    var company: String?
    var team: String?
    var members: [Member]?
}

class Member: Codable {
    var name: String?
    var age: Int?
    var location: String?
    var github: String?
    var hipo: Hipo?
}

class Hipo: Codable {
    var position: String?
    var years_in_hipo: Int?
}

