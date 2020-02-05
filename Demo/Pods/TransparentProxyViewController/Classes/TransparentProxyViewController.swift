//
//  TransparentProxyViewController.swift
//
//  Created by Siarhei Ladzeika on 6/26/17.
//  Copyright © 2017 Siarhei Ladzeika. All rights reserved.
//

import UIKit
import ImmediateAnimationController

open class TransparentProxyViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setupTransparency()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupTransparency()
    }
    
    // MARK: Life cycle
    override open func viewDidLoad() {
        super.viewDidLoad()
        view.isOpaque = false
        view.backgroundColor = .clear
    }
    
    private func setupTransparency() {
        transitioningDelegate = self
        definesPresentationContext = true
        modalPresentationStyle = .overCurrentContext
        if UIDevice.current.userInterfaceIdiom == .pad {
            modalTransitionStyle = .coverVertical
        }
    }
    
    // MARK: - UIViewControllerTransitioningDelegate
    
    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return ImmediateAnimationController.shared
    }
    
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return ImmediateAnimationController.shared
    }
}


