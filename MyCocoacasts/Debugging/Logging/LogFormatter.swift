//
//  LogFormatter.swift
//  MyCocoacasts
//
//  Created by Sumit Makkar on 20/10/19.
//  Copyright © 2019 Sumit Makkar. All rights reserved.
//

import CocoaLumberjack

class LogFormatter: NSObject , DDLogFormatter
{
    private let dateFormatter: DateFormatter =
    {
        let newDateFormatter = DateFormatter()
        
        newDateFormatter.dateFormat = "yyyy/MM/dd HH:mm:ss:SSS"
        return newDateFormatter
    }()
    
    func format(message logMessage: DDLogMessage) -> String?
    {
        let logLevel: String
        
        switch logMessage.flag
        {
            case .error  : logLevel = "ERROR"
            case .debug  : logLevel = "DEBUG"
            case .info   : logLevel = "INFO"
            case .verbose: logLevel = "VERBOSE"
            default      : logLevel = "WARNING"
        }
        
        let message   = logMessage.message
        let filename  = logMessage.file
        let line      = logMessage.line
        let timeStamp = self.dateFormatter.string(from: logMessage.timestamp)
        
        if let function = logMessage.function
        {
            return "\(timeStamp) | \(filename):\(line) - \(function) | [\(logLevel)] \(message)"
        }
        else
        {
            return "\(timeStamp) | \(filename):\(line) | [\(logLevel)] \(message)"
        }
    }
}
