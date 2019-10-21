//
//  Configuration.swift
//  MyCocoacasts
//
//  Created by Sumit Makkar on 17/10/19.
//  Copyright © 2019 Sumit Makkar. All rights reserved.
//

import Foundation

enum Configuration: String
{
    case debug
    case release
    
    static let current: Configuration =
    {
        guard let value = Bundle.main.infoDictionary?["CONFIGURATION"] as? String
        else
        {
            fatalError("No Configuration Found")
        }
        
        guard let rawValue = value.split(separator: "/").first
        else
        {
            fatalError("Invalid Configuration.")
        }
        
        guard let configuration = Configuration(rawValue: rawValue.lowercased())
        else
        {
            fatalError("Invalid ")
        }
        
        return configuration
    }()
}
