//
//  RootViewController.swift
//  MyCocoacasts
//
//  Created by Sumit Makkar on 17/10/19.
//  Copyright © 2019 Sumit Makkar. All rights reserved.
//

import UIKit
import CocoaLumberjack

class RootViewController: UIViewController
{
    //MARK: - Properties
    private lazy var viewController: UITabBarController =
    {
        guard let tabBarController = UIStoryboard(name: "Main" , bundle: .main).instantiateInitialViewController() as? UITabBarController
        else
        {
            fatalError("Unable to instantiate UITabbar Controller.")
        }
        
        return tabBarController
    }()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.setupChildViewControllers()
        
        DDLogVerbose("This is a verbose log.")
        DDLogError("This is an error log.")
    }
    
    
    private func setupChildViewControllers()
    {
        self.addChild(self.viewController)
        
        self.view.addSubview(self.viewController.view)
        
        self.view.topAnchor.constraint(equalTo: self.view.topAnchor).isActive     = true
        self.view.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive   = true
        self.view.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        self.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive  = true
        
        self.viewController.didMove(toParent: self)
    }
}
