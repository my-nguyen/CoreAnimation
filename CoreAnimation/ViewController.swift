//
//  ViewController.swift
//  CoreAnimation
//
//  Created by My Nguyen on 8/13/16.
//  Copyright © 2016 My Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tap: UIButton!
    var imageView: UIImageView!
    var currentAnimation = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // place a penguin in the middle of an iPad-sized landscape screen
        imageView = UIImageView(image: UIImage(named: "penguin"))
        imageView.center = CGPoint(x: 512, y: 384)
        view.addSubview(imageView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapped(sender: AnyObject) {
        // cycle through animations each time the button is tapped
        currentAnimation += 1
        if currentAnimation > 7 {
            currentAnimation = 0
        }
    }
}