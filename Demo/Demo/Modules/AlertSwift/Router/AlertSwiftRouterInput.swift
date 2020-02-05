//
//  AlertSwiftRouterInput.swift
//  Demo
//
//  Created by Cheslau Bachko.
//  Copyright © 2020-present demo. All rights reserved.
//

import Foundation

protocol AlertSwiftRouterInput: class {
    func dismiss(_ completion: @escaping (() -> Void))
}
