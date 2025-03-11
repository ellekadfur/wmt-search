//
//  ServiceEnvironment.swift
//  demoList
//
//  Created by Elle Kadfur on 02/28/25.
//

import Foundation



struct CountryListRequest: Request {    
    let path: String = "/peymano-wmt/32dcb892b06648910ddd40406e37fdab/raw/db25946fd77c5873b0303b858e861ce724e0dcd0/countries.json"
}

typealias CountryListResponse = [CountryModel]


struct CountryModel: Codable {
    let capital: String
    let code: String
    let currency: Currency
   
    let flag: String
    let language: Language
    let name: String
    let region: String
    
    enum CodingKeys: String, CodingKey {
        case capital
        case code
        case currency
        case flag
        case language
        case name
        case region
    }
}

extension CountryModel {
    static var sampleList: [CountryModel] {
        let currency = Currency(code: "Code", name: "name", symbol: nil)
        let language = Language(code: nil, name: "name")
        return [CountryModel(capital: "Capitale", code: "IN", currency: currency, flag: "IN-flag", language: language, name: "India", region: "Region")]
    }
}


struct Currency: Codable {
    let code: String
    let name: String
    let symbol: String?
    
    enum CodingKeys: String, CodingKey {
        case code
        case name
        case symbol
    }
}


struct Language: Codable {
    let code: String?
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case code
        case name
    }
}


