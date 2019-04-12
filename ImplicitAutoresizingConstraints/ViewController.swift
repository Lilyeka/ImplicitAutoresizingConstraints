//
//  ViewController.swift
//  ImplicitAutoresizingConstraints
//
//  Created by Лилия Левина on 12/04/2019.
//  Copyright © 2019 Лилия Левина. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let lab1 = UILabel(frame:CGRect(x:270,y:60,width:42,height:22))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    }

    override func viewDidLayoutSubviews() {
    // this code shows automatically generated implicit constraints of class NSAutoresizingMaskLayoutConstraint
        let arr1 = lab1.constraintsAffectingLayout(for:.horizontal)
        let arr2 = lab1.constraintsAffectingLayout(for:.vertical)
        let s = String(format: "\n\n%@\nH: %@\nV:%@", lab1, arr1, arr2)
        print(s)
    }

}
