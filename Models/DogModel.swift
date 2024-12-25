//
//  DogModel.swift
//  Dog
//
//  Created by MANVELYAN Gevorg on 29.11.2024.
//

import Foundation

struct Dog: Codable, Identifiable {
    let id = UUID() // Локальный уникальный идентификатор
    let name: String?
    let imageLink: String?
    let goodWithChildren: Int?
    let goodWithOtherDogs: Int?
    let shedding: Int?
    let grooming: Int?
    let drooling: Int?
    let coatLength: Int?
    let goodWithStrangers: Int?
    let playfulness: Int?
    let protectiveness: Int?
    let trainability: Int?
    let energy: Int?
    let barking: Int?
    let minLifeExpectancy: Int?
    let maxLifeExpectancy: Int?
    let maxHeightMale: Double?
    let maxHeightFemale: Double?
    let maxWeightMale: Double?
    let maxWeightFemale: Double?
    let minHeightMale: Double?
    let minHeightFemale: Double?
    let minWeightMale: Double?
    let minWeightFemale: Double?

    // Связь полей JSON с именами свойств модели
    enum CodingKeys: String, CodingKey {
        case name
        case imageLink = "image_link"
        case goodWithChildren = "good_with_children"
        case goodWithOtherDogs = "good_with_other_dogs"
        case shedding, grooming, drooling, coatLength = "coat_length"
        case goodWithStrangers = "good_with_strangers"
        case playfulness, protectiveness, trainability, energy, barking
        case minLifeExpectancy = "min_life_expectancy"
        case maxLifeExpectancy = "max_life_expectancy"
        case maxHeightMale = "max_height_male"
        case maxHeightFemale = "max_height_female"
        case maxWeightMale = "max_weight_male"
        case maxWeightFemale = "max_weight_female"
        case minHeightMale = "min_height_male"
        case minHeightFemale = "min_height_female"
        case minWeightMale = "min_weight_male"
        case minWeightFemale = "min_weight_female"
    }
}
