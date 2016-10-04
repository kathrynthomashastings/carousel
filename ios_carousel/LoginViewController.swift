//
//  LoginViewController.swift
//  Carousel
//
//  Created by Kathryn Hastings on 10/2/16.
//  Copyright © 2016 Kathryn Hastings. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var fieldParentView: UIView!
    @IBOutlet weak var buttonParentView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var fieldInitialY: CGFloat!
    var fieldOffset: CGFloat!
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        scrollView.delegate = self
        
        // Set the scroll view content size
        scrollView.contentSize = scrollView.frame.size
        
        // Set the content insets
        scrollView.contentInset.bottom = 100
        
        // Set button variables
        buttonInitialY = buttonParentView.frame.origin.y
        buttonOffset = -120
        
        // Set field variables
        fieldInitialY = fieldParentView.frame.origin.y
        fieldOffset = -100
        
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillShow, object: nil, queue: OperationQueue.main) { (notification: Notification) in
            // Any code you put in here will be called when the keyboard is about to display
            
            // Move the fields up above keyboard
            self.fieldParentView.frame.origin.y = self.fieldInitialY + self.fieldOffset
            
            // Move the button up above keyboard
            self.buttonParentView.frame.origin.y = self.buttonInitialY + self.buttonOffset

            // Scroll the scrollview up
            // self.scrollView.contentOffset.y = self.scrollView.contentInset.bottom
            
        }
        
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillHide, object: nil, queue: OperationQueue.main) { (notification: Notification) in
            // Any code you put in here will be called when the keyboard is about to hide
            
            // Move the fields back to origin position
            self.fieldParentView.frame.origin.y = self.fieldInitialY
            
            // Move the button back to origin position
            self.buttonParentView.frame.origin.y = self.buttonInitialY
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    @IBAction func didTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    func run(after wait: TimeInterval, closure: @escaping () -> Void) {
        let queue = DispatchQueue.main
        queue.asyncAfter(deadline: DispatchTime.now() + wait, execute: closure)
    }
    
    @IBAction func didPressLogin(_ sender: AnyObject) {
        
        
        if emailTextField.text!.isEmpty || passwordTextField.text!.isEmpty {
            
            let alertController = UIAlertController(title: "Email Required", message: "Please enter your email address.", preferredStyle: .alert)
            
            // create an OK action
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                // handle response here.
            }
            
            // add the OK action to the alert controller
            alertController.addAction(OKAction)
            
            present(alertController, animated: true) {
                // optional code for what happens after the alert controller has finished presenting
            }
            
        } else {
            
            self.activityIndicator.startAnimating()

            // Delay for 2 seconds, then run the code between the braces.
            let secondsToDelay = 2.0
            
            run(after: secondsToDelay) {
                
                // This code will run after the delay

                if self.emailTextField.text == "hi@gmail.com" && self.passwordTextField.text == "password" {
                    
                    // Code that runs if both email and password match the text we are looking for in each case

                    self.activityIndicator.stopAnimating()

                    self.performSegue(withIdentifier: "afterLoginSegue", sender: nil)

                } else {

                    // Code that runs if either the email or password do NOT match the text we are looking for in each case
                    
                    self.activityIndicator.stopAnimating()
                    
                    let alertController = UIAlertController(title: "Sign In Failed", message: "Please enter your email address.", preferredStyle: .alert)
                    
                    // create an OK action
                    let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                        // handle response here.
                    }
                    
                    // add the OK action to the alert controller
                    alertController.addAction(OKAction)
                    
                    self.present(alertController, animated: true) {
                        // optional code for what happens after the alert controller has finished presenting
                    }
                    
                }
                
            }
        }
    }
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
}
