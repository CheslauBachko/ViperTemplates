//
//  AlertSwiftPresenter.swift
//  Demo
//
//  Created by Cheslau Bachko.
//  Copyright © 2020-present demo. All rights reserved.
//

import Foundation
import ViperMcFlurrySwift

fileprivate enum AlertSwiftPresenterState {
    case initial
    case ready
    case deinitialized
}

class AlertSwiftPresenter: AlertSwiftModuleInput, AlertSwiftViewOutput, AlertSwiftInteractorOutput, ViperModuleOutput {

    // MARK: - VIPER Vars

    weak var view: AlertSwiftViewInput!
    var interactor: AlertSwiftInteractorInput!
    var router: AlertSwiftRouterInput!
    weak var output: AlertSwiftModuleOutput?
    private final var state: AlertSwiftPresenterState = .initial

    // MARK: - Vars

    private final var config: AlertSwiftModuleInputConfig!
    private final var dismissed = false

    // MARK: - Life cycle

    func willDeinit() {
        if state == .ready {
            interactor.deinitialize()
        }
        state = .deinitialized
    }

    // MARK: - RamblerViperModuleInput


    func setModuleOutput(_ moduleOutput: ViperModuleOutput) {
        output = moduleOutput as? AlertSwiftModuleOutput
    }

    // MARK: - AlertSwiftViewOutput

    func viewIsReady() {
        assert(state == .ready)
        view.setAlertTitle(config.title)
        view.setAlertMessage(config.message)
    }

    func userDidTapOnClose() {
        guard state == .ready && dismissed == false else { return }
        dismissed = true
        router.dismiss {
            self.output?.alertswiftModuleDidDismiss()
        }
    }

    // MARK: - AlertSwiftModuleInput

    func configure(with config: AlertSwiftModuleInputConfig) {
        assert(state == .initial)
        state = .ready
        self.config = config
        interactor.configure()
    }

}
