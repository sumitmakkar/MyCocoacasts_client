//
//  Logger.swift
//  MyCocoacasts
//
//  Created by Sumit Makkar on 20/10/19.
//  Copyright © 2019 Sumit Makkar. All rights reserved.
//

import CocoaLumberjack
import PaperTrailLumberjack

final class Logger
{
    #if DEBUG
        static let defaultLogLevel: DDLogLevel = .all
    #else
        static let defaultLogLevel: DDLogLevel = .error
    #endif
    
    class func setup()
    {
        DDTTYLogger.sharedInstance.logFormatter = LogFormatter()
        DDLog.add(DDTTYLogger.sharedInstance , with: defaultLogLevel)
        
        if let paperTrailLogger = RMPaperTrailLogger.sharedInstance()
        {
            paperTrailLogger.port = 45206
            paperTrailLogger.host = "logs.papertrailapp.com"
            DDLog.add(paperTrailLogger , with: defaultLogLevel)
        }
    }
}
