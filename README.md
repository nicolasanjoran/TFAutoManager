# TFAutoManager
This is a TextField Library for iOS that helps to handle automatically textfields that enter in editing mode and are hidden by iOS keyboard. 

## Example
![Example GIF](https://github.com/nicolasanjoran/TFAutoManager/raw/master/showcase.gif)

## How to use TFAutoManager?

The only thing you have to do, is to instanciate TFAutoManager within your ViewController and call the setup() method by passing your ViewController's view. Then, you can set the TFAutoManager instance as your textfields delegate.

Following is an example:

```swift
class ViewController: UIViewController {

    @IBOutlet weak var txtField1: UITextField!
    @IBOutlet weak var txtField2: UITextField!
    @IBOutlet weak var txtField3: UITextField!
    @IBOutlet weak var txtField4: UITextField!
    @IBOutlet weak var txtField5: UITextField!
    @IBOutlet weak var txtField6: UITextField!
    
    // Instanciate TFAutoManager, so that we can reuse it later on.
    let tfAutoManager = TFAutoManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup TFAutoManager in order to manager your VC's view.
        tfAutoManager.setup(self.view)
        
        // Do not forget to setup the delegate attribute of your textfields.
        self.txtField1.delegate = tfAutoManager
        self.txtField2.delegate = tfAutoManager
        self.txtField3.delegate = tfAutoManager
        self.txtField4.delegate = tfAutoManager
        self.txtField5.delegate = tfAutoManager
        self.txtField6.delegate = tfAutoManager

    }
}
```
