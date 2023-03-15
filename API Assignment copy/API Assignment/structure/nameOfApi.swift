//
//  nameOfApi.swift
//  API Assignment
//
//  Created by promact on 06/03/23.
//

import Foundation

struct NameOfApi: Codable {
    let API: String?
    let Description: String?
}


struct jsonStructs:Codable {
        let fact:String?
        let length:Int?
}
    
struct jsonStructsFor3rdAPI:Codable {
    let chartName:String?
    let disclaimer:String?
}

struct jsonStructsFor4rdAPI:Codable {
    let type:String?
    let activity:String?
}


struct jsonStructsFor5rdAPI:Codable {
    let name:String?
    let age:Int?
}

struct jsonStructsFor6rdAPI:Codable {
    let name:String?
    let gender:String?
}


struct jsonStructsFor7rdAPI:Codable {
    let country_id:String?
    let probability:Double?
}

struct jsonStructsFor8rdAPI:Codable {
    let Nation:String?
    let Population:Int64?
}

struct jsonStructsFor9rdAPI:Codable {
    let message:String?
    let status:String?
}


struct jsonStructsFor10rdAPI:Codable {
    let ip:String?
}


struct jsonStructsFor11rdAPI:Codable {
    let ip:String?
    let region:String?
}

struct jsonStructsFor12rdAPI:Codable {
    let type:String?
    let setup:String?
}





