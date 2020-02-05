//
//  AlertSwiftConfigurator.swift
//  Demo
//
//  Created by Cheslau Bachko.
//  Copyright © 2020-present demo. All rights reserved.
//

import UIKit
import OnDeallocateX

import ViperMcFlurrySwift


class AlertSwiftModuleConfigurator: ViperModuleFactory {


    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
        if let viewController = viewInput as? AlertSwiftViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: AlertSwiftViewController) {

        guard viewController.output == nil else { // prevent double configuration
            return
        }

        let router = AlertSwiftRouter()

        let presenter = AlertSwiftPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = AlertSwiftInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
        viewController.moduleInput = presenter

        router.transitionHandler = viewController
        router.calleeOutput = presenter

        viewController.onWillDeallocate {
            presenter.willDeinit()
        }

        
    }

    func create() -> UIViewController {
        let viewController = AlertSwiftViewController()
        
        configureModuleForViewInput(viewInput: viewController)
        
        return viewController
    }
    // MARK: - ViperModuleFactoryProtocol

    func instantiateModuleTransitionHandler() -> ViperModuleTransitionHandler {
        return create()
    }
    
}
