//
//  APIServices.swift
//  demoList
//
//  Created by Elle Kadfur on 02/28/25.
//

import Foundation

protocol CountryServicesProtocol {
    func getCountryList() async -> CountryListResponse
}


class CountryServices: CountryServicesProtocol {
    func getCountryList() async -> [CountryModel]  {
        do {
            let counties: [CountryModel] = try await APIClient.shared.fetch(request: CountryListRequest())
            return counties
        } catch {
            print("error: \(error)")
        }
        return []
    }
}
