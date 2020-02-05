//
//  AlertSwiftInitializer.swift
//  Demo
//
//  Created by Cheslau Bachko.
//  Copyright © 2020-present demo. All rights reserved.
//

import UIKit

class AlertSwiftModuleInitializer: NSObject {

    // Connect with object on storyboard
    @IBOutlet weak var alertswiftViewController: AlertSwiftViewController!

    override func awakeFromNib() {

        let configurator = AlertSwiftModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: alertswiftViewController)
    }

}
