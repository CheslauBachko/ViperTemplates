//
//  AlertSwiftRouter.swift
//  Demo
//
//  Created by Cheslau Bachko.
//  Copyright © 2020-present demo. All rights reserved.
//

import ViperMcFlurrySwift

class AlertSwiftRouter: AlertSwiftRouterInput {

    // MARK: - VIPER Vars

    weak var calleeOutput: (ViperModuleOutput /* Add supported protocols here, e.g: & AnotherModuleOutput */)!
    weak var transitionHandler: ViperModuleTransitionHandler!


    // MARK: - AlertSwiftRouterInput

    func dismiss(_ completion: @escaping (() -> Void)) {
        transitionHandler.closeCurrentModule(true) {
            completion()
        }
    }
}
