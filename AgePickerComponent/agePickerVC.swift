
//
//  agePickerVC.swift
//  AgePickerComponent
//
//  Created by ROHIT DAS on 16/04/24.
//

import UIKit

class agePickerVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    // MARK: - Properties
    
    private let ageGroupLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .black
        label.text = "Age Group"
        return label
    }()
    
    private let minAgeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .black
        label.textAlignment = .center
        label.text = "Min Age"
        return label
    }()
    
    private let maxAgeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .black
        label.textAlignment = .center
        label.text = "Max Age"
        return label
    }()
    
    private lazy var minAgeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()
    
    private lazy var maxAgeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let doneButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Done", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .red
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(doneButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        view.backgroundColor = .white
        
        // Adding ageGroupLabel
        view.addSubview(ageGroupLabel)
        ageGroupLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ageGroupLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            ageGroupLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            ageGroupLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        // Configuring minAgeStackView
        minAgeStackView.addArrangedSubview(minAgeLabel)
        let minAgePickerView = UIPickerView()
        minAgePickerView.dataSource = self
        minAgePickerView.delegate = self
        minAgeStackView.addArrangedSubview(minAgePickerView)
        
        // Configuring maxAgeStackView
        maxAgeStackView.addArrangedSubview(maxAgeLabel)
        let maxAgePickerView = UIPickerView()
        maxAgePickerView.dataSource = self
        maxAgePickerView.delegate = self
        maxAgeStackView.addArrangedSubview(maxAgePickerView)
        
        // Adding stackView
        view.addSubview(stackView)
        stackView.addArrangedSubview(minAgeStackView)
        stackView.addArrangedSubview(maxAgeStackView)
        
        //  stackView constraints
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: ageGroupLabel.bottomAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80)
        ])
        
        // Adding doneButton
        view.addSubview(doneButton)
        NSLayoutConstraint.activate([
            doneButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20),
            doneButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            doneButton.widthAnchor.constraint(equalToConstant: 80),
            doneButton.heightAnchor.constraint(equalToConstant: 40),
            doneButton.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -20)
        ])
    }
    
    // MARK: - UIPickerViewDataSource
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 51
    }
    
    // MARK: - UIPickerViewDelegate
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        let age = 20 + row
        return "\(age) years"
    }
    
    // MARK: - doneButton Action
    
    @objc private func doneButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
}


