//
//  ViewController.swift
//  ImplicitAutoresizingConstraints
//
//  Created by Лилия Левина on 12/04/2019.
//  Copyright © 2019 Лилия Левина. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let lab1 = UILabel(frame:CGRect(x:270,y:60,width:42,height:22))
        lab1.autoresizingMask = [.flexibleLeftMargin, .flexibleBottomMargin]
        lab1.text = "Hello"
        self.view.addSubview(lab1)
        
        let lab2 = UILabel()
        lab2.translatesAutoresizingMaskIntoConstraints = false
        lab2.text = "Howdy"
        self.view.addSubview(lab2)
        NSLayoutConstraint.activate([
            lab2.topAnchor.constraint(
                equalTo: lab1.bottomAnchor, constant: 20),
            lab2.trailingAnchor.constraint(
                equalTo: self.view.trailingAnchor, constant: -20)
            ])
        
//  This causes the first label to be involved in autolayout. Therefore, the first label magically acquires four automatically generated implicit constraints of class NSAutoresizingMaskLayoutConstraint, such as to give the label the same size and position, and the same behavior when its superview is resized, that it had when it was configured by its frame and autoresizingMask:
//        <NSAutoresizingMaskLayoutConstraint:0x6000002818b0 h=&-- v=--&
//        UILabel:0x7f9d3820bf80'Hello'.midX == UIView:0x7f9d383079d0.width-29>
//        <NSAutoresizingMaskLayoutConstraint:0x60000009fe50 h=&-- v=--&
//        UILabel:0x7f9d3820bf80'Hello'.midY == 71>
//        <NSAutoresizingMaskLayoutConstraint:0x60000009fef0 h=&-- v=--&
//        UILabel:0x7f9d3820bf80'Hello'.width == 42>
//        <NSAutoresizingMaskLayoutConstraint:0x6000002821c0 h=&-- v=--&
//        UILabel:0x7f9d3820bf80'Hello'.height == 22>
    }


}

