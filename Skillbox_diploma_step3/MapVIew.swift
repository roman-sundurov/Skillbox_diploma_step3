//
//  MapVIew.swift
//  Skillbox_diploma_step3
//
//  Created by Roman on 12.12.2021.
//

import UIKit

@IBDesignable class MapVIew: UIView {

    override func draw(_ rect: CGRect) {
      let path = UIBezierPath(ovalIn: rect)
      UIColor.green.setFill()
      path.fill()
    }

}
