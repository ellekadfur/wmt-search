//
//  CountryDetailsViewController.swift
//  demoList
//
//  Created by Anand on 11/03/25.
//

import UIKit

class CountryDetailsViewController: UIViewController {
    @IBOutlet weak var countryNameLabel: UILabel!
    private(set) var viewModel: CountyDetailsViewModelProtocol!
    private(set) var country: CountryDomainModel!
    
    init(_ viewModel: CountyDetailsViewModelProtocol, country: CountryDomainModel) {
        self.viewModel = viewModel
        self.country = country
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
        
    override func loadView() {
        super.loadView()
        
        let nibName = String(describing: Self.self)
        let bundle = Bundle(for: Self.self)

        if let nibView = bundle.loadNibNamed(nibName, owner: self, options: nil)?.first as? UIView {
            self.view = nibView // ✅ Assign the view without duplication
        } else {
            fatalError("Failed to load \(nibName).xib")
        }
        
        // Populate View
        self.countryNameLabel.text = self.country.name
    }
}
