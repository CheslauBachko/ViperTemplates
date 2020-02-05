//
//  AlertSwiftConfiguratorTests.swift
//  Demo
//
//  Created by Cheslau Bachko.
//  Copyright © 2020-present demo. All rights reserved.
//

import XCTest

@testable import Demo
class AlertSwiftModuleConfiguratorTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testConfigureModuleForViewController() {

        //given
        let viewController = AlertSwiftViewControllerMock()
        let configurator = AlertSwiftModuleConfigurator()

        

        //when
        
        configurator.configureModuleForViewInput(viewInput: viewController)
        

        //then
        XCTAssertNotNil(viewController.output, "AlertSwiftViewController is nil after configuration")
        XCTAssertTrue(viewController.output is AlertSwiftPresenter, "output is not AlertSwiftPresenter")

        let presenter: AlertSwiftPresenter = viewController.output as! AlertSwiftPresenter
        XCTAssertNotNil(presenter.view, "view in AlertSwiftPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in AlertSwiftPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is AlertSwiftRouter, "router is not AlertSwiftRouter")
        XCTAssertTrue((presenter.router as!AlertSwiftRouter).transitionHandler is AlertSwiftViewController, "router.transitionHandler is not AlertSwiftViewController")

        let interactor: AlertSwiftInteractor = presenter.interactor as! AlertSwiftInteractor
        XCTAssertNotNil(interactor.output, "output in AlertSwiftInteractor is nil after configuration")
    }

    class AlertSwiftViewControllerMock: AlertSwiftViewController {

    }
}
