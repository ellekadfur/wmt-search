//
//  Router.swift
//  demoList
//
//  Created by Anand on 11/03/25.
//
import UIKit

struct Router {
    static func mainViewController() -> UIViewController {
        let countriesViewController = CountryListController(CountyListViewModel(countryServices:
                                                                                        CountryServices()))
        countriesViewController.onSelectCountry = counryDetailsViewController
        return countriesViewController
    }
    
    static func counryDetailsViewController(countryModel : CountryDomainModel) -> UIViewController {
        let vc = CountryDetailsViewController(CountyDetailsViewModel(), country: countryModel)
        return vc
    }
    
}
