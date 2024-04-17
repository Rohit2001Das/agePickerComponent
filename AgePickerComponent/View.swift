//
//  View.swift
//  AgePickerComponent
//
//  Created by ROHIT DAS on 16/04/24.
//

import UIKit

class searchScreenView: UIView {
    private let titleLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 26.0)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
        
    }()
    
    private let ageLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .black
        label.numberOfLines = 0
        return label
        
    }()
    
    private let ageRangeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("24 years - 29 years", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18.0)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(handleAgeRangeButtonTapped), for: .touchUpInside)
        button.backgroundColor = .lightGray
        return button
    }()
    
    
    var viewModel: searchScreenViewModel? {
        didSet {
            configureUI()
        }
    }
    var ageRangeButtonTapped: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(titleLabel)
        addSubview(ageLabel)
        addSubview(ageRangeButton)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        ageRangeButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
            titleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: 10),
            
            
            
            ageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            ageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            
            ageRangeButton.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: 20),
            ageRangeButton.leadingAnchor.constraint(equalTo: ageRangeButton.leadingAnchor, constant: 30),
            ageRangeButton.trailingAnchor.constraint(equalTo: ageRangeButton.trailingAnchor, constant: -10),
            ageRangeButton.heightAnchor.constraint(equalToConstant: 30),
            ageRangeButton.widthAnchor.constraint(equalToConstant: 250),
            
            
            
        ])
        
    }
    
    private func configureUI() {
        guard let viewModel = viewModel else { return }
        titleLabel.text = viewModel.title
        ageLabel.text = viewModel.ageGroup
        
       
    }
    
    @objc private func handleAgeRangeButtonTapped() {
        ageRangeButtonTapped?()
    }
 }

