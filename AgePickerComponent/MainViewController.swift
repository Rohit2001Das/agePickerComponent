//
//  ViewController.swift
//  AgePickerComponent
//
//  Created by ROHIT DAS on 16/04/24.
//

import UIKit

class MainViewController: UIViewController {
    
    private let customSearchScreenView = searchScreenView()
    private var viewModel: searchScreenViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupViewModel()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        
        view.addSubview(customSearchScreenView)
        
        customSearchScreenView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            customSearchScreenView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            customSearchScreenView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10),
            customSearchScreenView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            customSearchScreenView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupViewModel() {
        let viewModel = searchScreenViewModel(title: "Lets find the one for you..", ageGroup: "Age: 25-35", ageRange: "20 - 30 years ")
        self.viewModel = viewModel
        customSearchScreenView.viewModel = viewModel
        
        customSearchScreenView.ageRangeButtonTapped = { [weak self] in
            
            let agePickerVC = agePickerVC()
            if let sheet = agePickerVC.sheetPresentationController {
                sheet.detents = [.medium()]
                sheet.prefersGrabberVisible = true
                sheet.preferredCornerRadius = 24
                
            }
            self?.present(agePickerVC, animated: true, completion: nil)
        }
        
    }
}
