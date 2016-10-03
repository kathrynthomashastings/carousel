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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
