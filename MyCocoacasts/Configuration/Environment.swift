//
//  Environment.swift
//  MyCocoacasts
//
//  Created by Sumit Makkar on 17/10/19.
//  Copyright © 2019 Sumit Makkar. All rights reserved.
//

import Foundation

enum Environment: String
{
    case staging
    case production
    
    static let current: Environment =
    {
        guard let value = Bundle.main.infoDictionary?["CONFIGURATION"] as? String
        else
        {
            fatalError("No Configuration Found")
        }
        
        guard let rawValue = value.split(separator: "/").last
        else
        {
            fatalError("Invalid Configuration.")
        }
        
        guard let environment = Environment(rawValue: rawValue.lowercased())
        else
        {
            fatalError("Invalid ")
        }
        
        return environment
    }()
    
    static var baseURL: URL
    {
        switch current
        {
            case .staging:
                return URL(string: "https://staging.cocoacasts.com")!

            case .production:
                return URL(string: "https://cocoacasts.com")!
        }
    }
}
