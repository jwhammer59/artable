//
//  RegisterVC.swift
//  Artable
//
//  Created by Jeffery Hammer on 1/28/19.
//  Copyright © 2019 Jeffery Hammer. All rights reserved.
//

import UIKit
import Firebase

class RegisterVC: UIViewController {
  
  // Outlets
  @IBOutlet weak var userNameTxt: UITextField!
  @IBOutlet weak var emailTxt: UITextField!
  @IBOutlet weak var passwordTxt: UITextField!
  @IBOutlet weak var confirmPassTxt: UITextField!
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
  @IBOutlet weak var passCheckImg: UIImageView!
  @IBOutlet weak var confirmPassCheckImg: UIImageView!
  

    override func viewDidLoad() {
        super.viewDidLoad()
      
      passwordTxt.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged )
      confirmPassTxt.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged )

    }
  
  @objc func textFieldDidChange(_ textField: UITextField) {
    guard let passTxt = passwordTxt.text else { return }
    
    // If we have started typing in the confrim pass text field.
    if textField == confirmPassTxt {
      passCheckImg.isHidden = false
      confirmPassCheckImg.isHidden = false
    } else {
      if passTxt.isEmpty {
        passCheckImg.isHidden = true
        confirmPassCheckImg.isHidden = true
        confirmPassTxt.text = ""
      }
    }
    
    // Make it so when the passwords match, the checkmarks turn green
    if passwordTxt.text == confirmPassTxt.text {
      passCheckImg.image = UIImage(named: AppImages.GreenCheck)
      confirmPassCheckImg.image = UIImage(named: AppImages.GreenCheck)
    } else {
      passCheckImg.image = UIImage(named: AppImages.RedCheck)
      confirmPassCheckImg.image = UIImage(named: AppImages.RedCheck)
    }
  }
    

  @IBAction func registerBtnPressed(_ sender: Any) {
    guard let email = emailTxt.text , email.isNotEmpty ,
      let username = userNameTxt.text , username.isNotEmpty ,
    let password = passwordTxt.text , password.isNotEmpty else { return }
    
    activityIndicator.startAnimating()
    
    guard let authUser = Auth.auth().currentUser else {
      return
    }
    
    let credential = EmailAuthProvider.credential(withEmail: email, link: password)
    authUser.linkAndRetrieveData(with: credential) { (result, error) in
      if let error = error {
        self.handleFireAuthError(error: error)
        return
      }
      self.activityIndicator.stopAnimating()
      self.dismiss(animated: true, completion: nil)
    }
  }
}
