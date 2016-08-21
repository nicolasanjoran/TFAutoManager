/*
 * (C) Copyright 2016 Nicolas Anjoran (http://nicolasanjoran.com/).
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * Contributors:
 *     Nicolas Anjoran
 */

import Foundation
import UIKit

class TFAutoManager: NSObject, UITextFieldDelegate {
    
    var view : UIView?
    var lastEditedTxtField : UITextField?
    
    func setup(view: UIView)
    {
        self.view = view
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillShow), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillHide), name: UIKeyboardWillHideNotification, object: nil)
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func keyboardWillShow(notification: NSNotification)
    {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
            if let txtFld = lastEditedTxtField {
                if(txtFld.frame.origin.y + txtFld.frame.height + 10 >= self.view!.frame.height - keyboardSize.height)
                {
                    self.view!.frame.origin.y = self.view!.frame.height - (keyboardSize.height + txtFld.frame.origin.y + txtFld.frame.height + 10)
                }
            }
        }
    }
    
    func keyboardWillHide(notification: NSNotification)
    {
        self.view!.frame.origin.y = 0
    }
    
    func dismissKeyboard()
    {
        self.view!.endEditing(true)
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        
        self.lastEditedTxtField = textField
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view!.endEditing(true)
        return false
    }
}