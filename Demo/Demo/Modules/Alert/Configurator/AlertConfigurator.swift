//
//  AlertConfigurator.swift
//  Demo
//
//  Created by Cheslau Bachko.
//  Copyright © 2020-present demo. All rights reserved.
//

import UIKit
import OnDeallocateX
import ViperMcFlurrySwift


class AlertModuleConfigurator: NSObject, ViperModuleFactory {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
        if let viewController = viewInput as? AlertViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: AlertViewController) {

        guard viewController.output == nil else { // prevent double configuration
            return
        }

        let router = AlertRouter()

        let presenter = AlertPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = AlertInteractor()
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
        let viewController = AlertViewController()
        
        configureModuleForViewInput(viewInput: viewController)
        
        return viewController
    }
    // MARK: - RamblerViperModuleFactoryProtocol

    func instantiateModuleTransitionHandler() -> ViperModuleTransitionHandler {
         return create()
    }
    
}
