//
//  array.swift
//  API Assignment
//
//  Created by promact on 06/03/23.
//

import Foundation

struct arr:Codable {
    let entries: [NameOfApi]
}


struct api3: Codable {
    let bpi:[jsonStructsFor3rdAPI]
}


struct arr2: Codable {
    let country: [jsonStructsFor7rdAPI]
}

struct arr3: Codable {
    let data: [jsonStructsFor8rdAPI]
}
