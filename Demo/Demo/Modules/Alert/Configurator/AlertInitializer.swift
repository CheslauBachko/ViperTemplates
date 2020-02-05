//
//  AlertInitializer.swift
//  Demo
//
//  Created by Cheslau Bachko.
//  Copyright © 2020-present demo. All rights reserved.
//

import UIKit

class AlertModuleInitializer: NSObject {

    // Connect with object on storyboard
    @IBOutlet weak var alertViewController: AlertViewController!

    override func awakeFromNib() {
        let configurator = AlertModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: alertViewController)
    }

}
