//
//  RoundedViews.swift
//  Artable
//
//  Created by Jeffery Hammer on 1/28/19.
//  Copyright © 2019 Jeffery Hammer. All rights reserved.
//

import Foundation
import UIKit

class RoundedButton : UIButton {
  override func awakeFromNib() {
    super.awakeFromNib()
    layer.cornerRadius = 5
  }
}

class RoundedShadowView : UIView {
  override func awakeFromNib() {
    super.awakeFromNib()
    layer.cornerRadius = 5
    layer.shadowColor = AppColors.Blue.cgColor
    layer.shadowOpacity = 0.4
    layer.shadowOffset = CGSize.zero
    layer.shadowRadius = 3
  }
}

class RoundedImageView : UIImageView {
  override func awakeFromNib() {
    super.awakeFromNib()
    layer.cornerRadius = 5
  }
}
