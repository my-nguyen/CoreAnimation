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
        // hide the tap button so the animations won't collide
        tap.hidden = true

        // animateWithDuration() accepts 5 parameters
        // (1) duration: NSTimeInterval - how long to animate for
        // (2) delay: NSTimeInterval - how long to pause before the animation starts
        // (3) options: UIViewAnimationOptions
        // (4) animations: () -> Void - what animations to execute
        // (5) completion: ((Bool) -> Void)?) - what to execute when the animation completes
        let animations = { [unowned self] in
            switch self.currentAnimation {
            case 0:
                // make the view twice its normal width and height
                self.imageView.transform = CGAffineTransformMakeScale(2, 2)
                break
            default:
                break
            }
        }
        let completion = { [unowned self] (finished: Bool) in
            // unhide the tap button
            self.tap.hidden = false
        }
        // duration of 1 second, no delay, no options
        UIView.animateWithDuration(1, delay: 0, options: [], animations: animations, completion: completion)

        // cycle through animations each time the button is tapped
        currentAnimation += 1
        if currentAnimation > 7 {
            currentAnimation = 0
        }
    }
}