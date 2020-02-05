//
//  AlertPresenter.swift
//  Demo
//
//  Created by Cheslau Bachko.
//  Copyright © 2020-present demo. All rights reserved.
//

import Foundation
import ViperMcFlurrySwift

fileprivate enum AlertPresenterState {
    case initial
    case ready
    case deinitialized
}

class AlertPresenter: NSObject, AlertModuleInput, AlertViewOutput, AlertInteractorOutput, ViperModuleOutput {

    // MARK: - VIPER Vars

    weak var view: AlertViewInput!
    var interactor: AlertInteractorInput!
    var router: AlertRouterInput!
    weak var output: AlertModuleOutput?
    private final var state: AlertPresenterState = .initial

    // MARK: - Vars

    private final var config: AlertModuleInputConfig!
    private final var dismissed = false

    // MARK: - Life cycle

    func willDeinit() {
        if state == .ready {
            interactor.deinitialize()
        }
        state = .deinitialized
    }

    // MARK: - RamblerViperModuleInput

    func setModuleOutput(_ moduleOutput: ViperModuleOutput!) {
        output = moduleOutput as? AlertModuleOutput
    }

    // MARK: - AlertViewOutput

    func viewIsReady() {
        assert(state == .ready)
        view.setAlertTitle(config.title)
        view.setAlertMessage(config.message)
    }

    func userDidTapOnClose() {
        guard state == .ready && dismissed == false else { return }
        dismissed = true
        router.dismiss {
            self.output?.alertModuleDidDismiss()
        }
    }

    // MARK: - AlertModuleInput

    func configure(with config: AlertModuleInputConfig) {
        assert(state == .initial)
        state = .ready
        self.config = config
        interactor.configure()
    }
}
