//
//  StringConstant.swift
//  Insta_Feed_UI_App
//
//  Created by Krunal Maisuriya on 03/11/2026.
//

import Foundation

extension String {
    
    func toDateString(outputFormat: String) -> String {
        let formatter = ISO8601DateFormatter()
        
        guard let date = formatter.date(from: self) else { return self }
        
        let outputFormatter = DateFormatter()
        outputFormatter.locale = Locale(identifier: "en_US_POSIX")
        outputFormatter.timeZone = .current
        outputFormatter.dateFormat = outputFormat
        
        return outputFormatter.string(from: date)
    }
}
