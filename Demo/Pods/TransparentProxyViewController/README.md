# TransparentProxyViewController

TransparentProxyViewController is controller with transparent background with zero animation duration.

## Purpose

You can use it as some proxy object to show other controller with more complex logic with animation. When somebody presents this
controller with animation flag set to true, then controller is shown without animation in anoy case. You can override *viewDidAppear* and 
show here your real controller you want to show. This can be usefull in bridging code expecting interaction with controller but target 
code does not contain controller, in this case proxy controller can be used as 'bridge' exposing UIViewController interface.

## Example

In demo application SecondViewController is used as transparent proxy, in *viewDidAppear* it shows ThirdViewController, and the second time
it hides self (this is done without any animation, so user thinks that ThirdViewController was shown directly).

```swift
import UIKit
import TransparentProxyViewController

class SecondViewController: TransparentProxyViewController {

    private var shown = false
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    deinit {
        print("SecondViewController deinit")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("SecondViewController viewDidAppear")
        
        if !shown {
            shown = true
            let controller = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ThirdViewController") as! ThirdViewController
            present(controller, animated: animated) {
                print("ThirdViewController show")
            }
        }
        else {
            dismiss(animated: false, completion: {
                print("SecondViewController dismissed")
            })
        }
    }

}
```


