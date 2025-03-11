//
//  CountyListViewModel.swift
//  demoList
//
//  Created by Anand on 11/03/25.
//

protocol CountyListViewModelProtocol: AnyObject {
    func fetchCounties() async
    var countiesDomainModels: [CountryDomainModel] { get }
    func filteredCounties(searchText: String?) -> [CountryDomainModel]
}

class CountyListViewModel: CountyListViewModelProtocol {
    private(set) var countiesDomainModels: [CountryDomainModel]
    private let countryServices: CountryServicesProtocol
        
    init (countryServices: CountryServicesProtocol) {
        self.countryServices = countryServices
        self.countiesDomainModels = []
    }
    
    func fetchCounties() async {
        let apiResponse = await countryServices.getCountryList()
        convertToDomainModel(apiResponse: apiResponse)
    }
    
    func filteredCounties(searchText: String?) -> [CountryDomainModel] {
        if searchText == nil {
            return countiesDomainModels
        }
        
        if searchText!.isEmpty {
            return countiesDomainModels
        }
        
        let lowercasedSearchText = searchText!.lowercased()
        return countiesDomainModels.filter { country in
            return country.name.lowercased().contains(lowercasedSearchText) ||
            country.capital.lowercased().contains(lowercasedSearchText)
        }
    }
    
    
    func convertToDomainModel(apiResponse: CountryListResponse) {
        // Map api response to View requirement
        self.countiesDomainModels = apiResponse.map { countryModel in
            CountryDomainModel(county: countryModel)
        }
    }
        
}
