//
//  AlertViewController.swift
//  Demo
//
//  Created by Cheslau Bachko.
//  Copyright © 2020-present demo. All rights reserved.
//

import UIKit
import TransparentProxyViewController

class AlertViewController: TransparentProxyViewController, AlertViewInput {

    // MARK: - VIPER Vars

    var output: AlertViewOutput!

    // MARK: - Vars

    private final var shown = false
    private final var alertTitle: String?
    private final var alertMessage: String?

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if !shown {
            shown = true
            showController()
        }
    }

    // MARK: - AlertViewInput

    func setAlertTitle(_ title: String?) {
        alertTitle = title
    }

    func setAlertMessage(_ message: String?) {
        alertMessage = message
    }

    // MARK: - Helpers

    private final func showController() {
        let controller = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        let closeAction = UIAlertAction (title: NSLocalizedString("OK", comment: ""), style: .cancel, handler:  { _ in
            self.output.userDidTapOnClose()
        })
        controller.addAction(closeAction)
        present(controller, animated: true, completion: nil)
    }
}
