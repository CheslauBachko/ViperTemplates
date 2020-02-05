//
//  TestStoryboardViewController.swift
//  Demo
//
//  Created by Cheslau Bachko.
//  Copyright © 2020-present demo. All rights reserved.
//

import UIKit

class TestStoryboardViewController: UIViewController, TestStoryboardViewInput {

    // MARK: - VIPER Vars

    var output: TestStoryboardViewOutput!

    // MARK: - Outlets
    // TODO: Place your code here

    // MARK: - Vars
    // TODO: Place your code here

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    // MARK: - TestStoryboardViewInput
    // TODO: Place your code here

    // MARK: - UI Actions
    // TODO: Place your code here

    // MARK: - Helpers
    // TODO: Place your code here
}
