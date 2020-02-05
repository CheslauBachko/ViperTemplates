//
//  AlertModuleInput.swift
//  Demo
//
//  Created by Cheslau Bachko.
//  Copyright © 2020-present demo. All rights reserved.
//

import ViperMcFlurrySwift

protocol AlertModuleInput: ViperModuleInput {
    func configure(with config: AlertModuleInputConfig)
}
