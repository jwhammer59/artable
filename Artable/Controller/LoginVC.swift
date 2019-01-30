//
//  LoginVC.swift
//  Artable
//
//  Created by Jeffery Hammer on 1/28/19.
//  Copyright © 2019 Jeffery Hammer. All rights reserved.
//

import UIKit
import Firebase

class LoginVC: UIViewController {
  
  
  @IBOutlet weak var emailTxt: UITextField!
  @IBOutlet weak var passTxt: UITextField!
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
  
  
  
  
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
  @IBAction func forgotPassBtnPressed(_ sender: Any) {
    
  }
  
  @IBAction func loginBtnPressed(_ sender: Any) {
    guard let email = emailTxt.text , email.isNotEmpty ,
      let password = passTxt.text , password.isNotEmpty else { return }
    
    activityIndicator.startAnimating()
    
    Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
      if let error = error {
        debugPrint(error.localizedDescription)
        self.handleFireAuthError(error: error)
        self.activityIndicator.stopAnimating()
        return
      }
      self.activityIndicator.stopAnimating()
      self.dismiss(animated: true, completion: nil)
      
    }
    
  }
  
  @IBAction func guestBtnPressed(_ sender: Any) {
    
  }
  
  
}
