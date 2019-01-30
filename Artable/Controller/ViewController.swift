//
//  ViewController.swift
//  Artable
//
//  Created by Jeffery Hammer on 1/27/19.
//  Copyright © 2019 Jeffery Hammer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
  }
  
  override func viewDidAppear(_ animated: Bool) {
    let storyboard = UIStoryboard(name: Storyboard.LoginStoryBoard, bundle: nil)
    let controller = storyboard.instantiateViewController(withIdentifier: StoryboardId.LoginVC)
    present(controller, animated: true, completion: nil)
  }

}

