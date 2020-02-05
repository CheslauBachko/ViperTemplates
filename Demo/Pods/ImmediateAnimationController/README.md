# ImmediateAnimationController

Implementation of object supporting UIViewControllerAnimatedTransitioning without animation. It can be useful to 
show some controllers immediately.

## Example

MyViewController will be shown immediately as transparent and then it will present 
SomeControllerController accordingly to *animated* flag.

```swift
import ImmediateAnimationController // if used as Cocoapod

class MyViewController: UIViewController, UIViewControllerTransitioningDelegate {

    // MARK: Life cycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        transitioningDelegate = self
        definesPresentationContext = true
        modalPresentationStyle = .overCurrentContext
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            modalTransitionStyle = .coverVertical
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.isOpaque = false
        view.backgroundColor = .clear
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let controller = SomeControllerController()
        present(controller, animated: animated, completion: nil)
    }
    
    // MARK: - UIViewControllerTransitioningDelegate
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return ImmediateAnimationController.shared
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return ImmediateAnimationController.shared
    }
    
}

```