//
//  signInViewController.swift
//  Carousel
//
//  Created by James De Angelis on 14/02/2015.
//  Copyright (c) 2015 James De Angelis. All rights reserved.
//

import UIKit

class signInViewController: UIViewController {
    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var buttonBlock: UIView!
    @IBOutlet weak var loginBlock: UIView!
    
    var originalLoginYCenter: CGFloat!
    var originalLoginBlockYCenter: CGFloat!
    var keyboardIsShowing: Bool! = false

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        activityIndicatorView.hidden = true
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        originalLoginYCenter = buttonBlock.center.y
        originalLoginBlockYCenter = loginBlock.center.y
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
        var animationCurve = curveValue.integerValue
        
        if (keyboardIsShowing == false) {
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(UInt(animationCurve << 16)), animations: {
            
            // Set view properties in here that you want to match with the animation of the keyboard
            // If you need it, you can use the kbSize property above to get the keyboard width and height.
            
            self.buttonBlock.center.y = self.buttonBlock.center.y - 200
            self.loginBlock.center.y = self.loginBlock.center.y - 90
            self.keyboardIsShowing = true
            }, completion: nil)
        }
        
//        } else if (keyboardIsShowing == false) {
//            self.buttonBlock.center.y = self.buttonBlock.center.y
//            self.loginBlock.center.y = self.loginBlock.center.y
//        }
        
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
        var animationCurve = curveValue.integerValue
        keyboardIsShowing = false
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(UInt(animationCurve << 16)), animations: {
            
            // Set view properties in here that you want to match with the animation of the keyboard
            // If you need it, you can use the kbSize property above to get the keyboard width and height.
            self.loginBlock.center.y = self.originalLoginBlockYCenter
            self.buttonBlock.center.y = self.originalLoginYCenter
            }, completion: nil)
        
    }
    @IBAction func passwordTapped(sender: AnyObject) {
        println(loginBlock.center.y)
    }
    
    @IBAction func signInPressed(sender: AnyObject) {
//        activityIndicatorView.hidden = false
//        activityIndicatorView.startAnimating()
//        self.activityIndicatorView.hidden = true
        
        if (self.emailInput.text == "email") && (self.passwordInput.text == "password") {
            var loadingView = UIAlertView(title: nil, message: "Signing in", delegate: nil, cancelButtonTitle: nil)
            loadingView.show()
            delay(2) {
                loadingView.dismissWithClickedButtonIndex(0, animated: true)
                self.performSegueWithIdentifier("signInSegue", sender: self)
            }
            
        } else if (emailInput.text.isEmpty == true) {
            var emptyEmailView = UIAlertView (title: "Enter email", message: "You must enter your email address", delegate: nil, cancelButtonTitle: "OK" )
            emptyEmailView.show()
            
        } else if (passwordInput.text.isEmpty == true) {
            var emptyPasswordView = UIAlertView (title: "Enter password", message: "You must enter a password", delegate: nil, cancelButtonTitle: "OK" )
            emptyPasswordView.show()
            
        } else {
            var loadingView = UIAlertView(title: nil, message: "Signing in", delegate: nil, cancelButtonTitle: nil)
            loadingView.show()
            delay(2) {
                loadingView.dismissWithClickedButtonIndex(0, animated: true)
                var alertView = UIAlertView(title: "Sign In Failed", message: "email/password is incorrect", delegate: nil, cancelButtonTitle: "OK")
                alertView.show()
            }
        }
//        var loadingView = UIAlertView(title: "", message: "Loading", delegate: nil, cancelButtonTitle: "")
//        loadingView.show()

    }
    @IBAction func onTapScreen(sender: AnyObject) {
        view.endEditing(true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
