//
//  AlertSwiftPresenterTests.swift
//  Demo
//
//  Created by Cheslau Bachko.
//  Copyright © 2020-present demo. All rights reserved.
//

import XCTest

@testable import Demo
class AlertSwiftPresenterTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    class MockInteractor: AlertSwiftInteractorInput {
        func deinitialize() {

        }

        // MARK: - AlertSwiftInteractorInput
        
        func configure() {
        }

    }

    class MockRouter: AlertSwiftRouterInput {

        // MARK: - Vars
        // TODO: Place your code here

        // MARK: - AlertSwiftRouterInput

        func dismiss(_ completion: @escaping (() -> Void)) {
            DispatchQueue.main.async {
                completion()
            }
        }

    }

    class MockViewController: AlertSwiftViewInput {

        // MARK: - Vars

        private final var title: String?
        private final var message: String?

        // MARK: - AlertSwiftViewInput

        func setAlertTitle(_ title: String?) {
            self.title = title
        }

        func setAlertMessage(_ message: String?) {
            self.message = message
        }
    }

}
