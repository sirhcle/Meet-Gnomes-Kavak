//
//  HomeModel.swift
//  Meet Gnomes
//
//  Created by CHERNANDER04 on 05/07/20.
//  Copyright © 2020 AMPM. All rights reserved.
//

import Foundation

struct HomeModel: Codable {
    var Brastlewark: [Brastlewark]?
}

struct Brastlewark: Codable {
    
    var id: Int?
    var name: String?
    var thumbnail: String?
    var age: Int?
    var weight: Float?
    var height: Float?
    var hair_color: String?
    var professions: [String]?
    var friends : [String]?
}




