//
//  ViewController.swift
//  Artable
//
//  Created by Jeffery Hammer on 1/27/19.
//  Copyright © 2019 Jeffery Hammer. All rights reserved.
//

import UIKit
import Firebase

class HomeVC: UIViewController {
  
  // Outlets
  @IBOutlet weak var loginOutBtnLbl: UIBarButtonItem!
  

  override func viewDidLoad() {
    super.viewDidLoad()
    if Auth.auth().currentUser == nil {
      Auth.auth().signInAnonymously { (result, error) in
        if let error = error {
          self.handleFireAuthError(error: error)
          debugPrint(error)
        }
      }
    }
  }
  
  override func viewDidAppear(_ animated: Bool) {
    if let user = Auth.auth().currentUser , !user.isAnonymous {
      // We are logged in
      loginOutBtnLbl.title = "Logout"
      } else {
        loginOutBtnLbl.title = "Login"
      }
      
    }
  
  
  fileprivate func presentLoginController() {
    let storyboard = UIStoryboard(name: Storyboard.LoginStoryBoard, bundle: nil)
    let controller = storyboard.instantiateViewController(withIdentifier: StoryboardId.LoginVC)
    present(controller, animated: true, completion: nil)
  }
  
  @IBAction func loginOutBtnPressed(_ sender: Any) {
    
    guard let user = Auth.auth().currentUser else { return }
    if user.isAnonymous {
      presentLoginController()
    } else {
      do {
        try Auth.auth().signOut()
        Auth.auth().signInAnonymously { (result, error) in
          if let error = error {
            self.handleFireAuthError(error: error)
            debugPrint(error)
          }
          self.presentLoginController()
        }
      } catch {
        self.handleFireAuthError(error: error)
        debugPrint(error)
      }
    }
  }
}

