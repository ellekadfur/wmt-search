//
//  demoListTests.swift
//  demoListTests
//
//  Created by Anand on 11/03/25.
//

import Testing
@testable import demoList
import Foundation

struct demoListTests {

    struct APIServiceTest {
        @Test func checkBaseUrl() async throws {
            // Write your test here and use APIs like `#expect(...)` to check expected conditions.
            let environment: Enviroment = .development
            
            #expect(environment.baseUrl == "https://gist.githubusercontent.com")
        }

        @Test func checkResolvedPath() async throws {
            // Write your test here and use APIs like `#expect(...)` to check expected conditions.
            let environment: Enviroment = .development
            let urlRequest = try environment.resolvedUrl(path: "path")
            
            #expect(urlRequest == URLRequest(url: URL(string: "https://gist.githubusercontent.com/path")!))
        }
    }
    
    struct ViewModelTest {
        @Test
        func checkApiToDomainModel() async throws {
            let countyListViewModel = CountyListViewModel(countryServices: CountryServices())
            countyListViewModel.convertToDomainModel(apiResponse: CountryModel.sampleList)
            #expect(countyListViewModel.countiesDomainModels.count == 1)
            
        }
    }
}
