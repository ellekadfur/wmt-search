//
//  CountryModel.swift
//  demoList
//
//  Created by Elle Kadfur on 02/28/25.
//

import Foundation


struct CountryDomainModel {
    let capital: String
    let name: String
    let region: String
    let code: String
    
    init(county: CountryModel) {
        self.capital = county.capital
        self.name = county.name
        self.region = county.region
        self.code = county.code
    }
}
