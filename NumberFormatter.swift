//
//  NumberFormatter.swift
//  NearMe4
//
//  Created by Shivum telang on 8/1/24.
//

import Foundation

func formatRating(_ rating: Double) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.maximumFractionDigits = 1
    formatter.minimumFractionDigits = 1
    
    if let formattedRating = formatter.string(from: NSNumber(value: rating)) {
        return formattedRating
    }
    return String(format: "%.2f", rating) // Fallback to default formatting
}
