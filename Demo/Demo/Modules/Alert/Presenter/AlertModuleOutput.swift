//
//  AlertModuleOutput.swift
//  Demo
//
//  Created by Cheslau Bachko.
//  Copyright © 2020-present demo. All rights reserved.
//

import ViperMcFlurrySwift

protocol AlertModuleOutput: ViperModuleOutput {
    func alertModuleDidDismiss()
}
