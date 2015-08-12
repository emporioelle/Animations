//
//  ViewController.swift
//  Animations
//
//  Created by Nelly Peters-Campbell on 8/9/15.
//  Copyright © 2015 npeterscampbel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var counter = 1
    
    var timer = NSTimer()
    
    var isAnimating = false

    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var frogsImage: UIImageView!
    
    @IBAction func updateImage(sender: AnyObject) {
        
        if isAnimating == false {
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("doAnimation"), userInfo: nil, repeats: true)
            isAnimating = true
            button.setTitle("Stop Jumping", forState: UIControlState.Normal)
            
        } else {
            timer.invalidate()
            isAnimating = false
            button.setTitle("Start Jumping", forState: UIControlState.Normal)
        }
        
            }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
 
    }
    
    func doAnimation() {
        if counter == 4 {
            counter = 1
        } else {
            counter++
        }
        
        frogsImage.image = UIImage(named: "frame\(counter).png"
        )

    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Called just before the view is actually displayed
    override func viewDidLayoutSubviews() {
        // Hiding off the screen
        frogsImage.center = CGPointMake(frogsImage.center.x - 400, frogsImage.center.y)
        print("test")
        
    }
    
    
    // Called just when the view appears
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(1) { () -> Void in
            self.frogsImage.center = CGPointMake(self.frogsImage.center.x + 400, self.frogsImage.center.y)
        }
        
    }


}

