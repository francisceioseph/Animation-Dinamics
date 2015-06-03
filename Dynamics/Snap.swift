//
//  Snap.swift
//  Dynamics
//
//  Created by Rafael Moura on 22/05/15.
//  Copyright (c) 2015 Rafael Moura. All rights reserved.
//

import UIKit

class Snap: UIViewController {

    var animator: UIDynamicAnimator?
    var snap: UISnapBehavior?
    
    @IBOutlet var blueBox: UIView!
    
    @IBAction func tapHandler(sender: UITapGestureRecognizer) {
    
        let tapLocation = sender.locationInView(self.view)
        
        if snap != nil{
            animator?.removeAllBehaviors()
        }
        
        snap = UISnapBehavior(item: self.blueBox, snapToPoint: tapLocation)
        animator?.addBehavior(snap)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        animator = UIDynamicAnimator(referenceView: self.view)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
