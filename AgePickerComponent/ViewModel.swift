//
//  ViewModel.swift
//  AgePickerComponent
//
//  Created by ROHIT DAS on 16/04/24.
//


import Foundation

class searchScreenViewModel {
    var title: String
    var ageGroup: String
    let ageRange: String
    
    init(title: String, ageGroup: String, ageRange: String) {
        self.title = title
        self.ageGroup = ageGroup
        self.ageRange = ageRange
    }
}
