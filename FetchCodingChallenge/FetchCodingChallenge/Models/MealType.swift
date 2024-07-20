//
//  MealType.swift
//  FetchCodingChallenge
//
//  Created by Nick Dimitrakas on 7/19/24.
//

import Foundation

public enum MealType: Int, Codable {
    case breakfast = 0
    case lunch = 1
    case dinner = 2
    case dessert = 3
    
    func getTitle() -> String {
        switch self {
        case .breakfast:
            return "Breakfast"
        case .lunch:
            return "Lunch"
        case .dinner:
            return "Dinner"
        case .dessert:
            return "Dessert"
        }
    }
}
