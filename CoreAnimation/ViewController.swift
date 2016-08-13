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
                // make the image twice its normal width and height
                self.imageView.transform = CGAffineTransformMakeScale(2, 2)
            case 1:
                // reset the image to its default size
                self.imageView.transform = CGAffineTransformIdentity
            case 2:
                // move the image by a certain distance
                self.imageView.transform = CGAffineTransformMakeTranslation(-256, -256)
            case 3:
                // reset the image to its default position
                self.imageView.transform = CGAffineTransformIdentity
            case 4:
                // rotate the image 90 degrees clockwise
                self.imageView.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
            case 5:
                // reset the image to 0 degree
                self.imageView.transform = CGAffineTransformIdentity
            case 6:
                // turn the image to almost invisible and the background to green
                self.imageView.alpha = 0.1
                self.imageView.backgroundColor = UIColor.greenColor()
            case 7:
                // reset the image transparency and its background color
                self.imageView.alpha = 1
                self.imageView.backgroundColor = UIColor.clearColor()
            default:
                break
            }
        }
        let completion = { [unowned self] (finished: Bool) in
            // unhide the tap button
            self.tap.hidden = false
        }
        // animate for 1 second with no delay and no options using the default ease-in-ease-out animation
        // UIView.animateWithDuration(1, delay: 0, options: [], animations: animations, completion: completion)
        // animate using spring animation
        UIView.animateWithDuration(1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: animations, completion: completion)

        // cycle through animations each time the button is tapped
        currentAnimation += 1
        if currentAnimation > 7 {
            currentAnimation = 0
        }
    }
}