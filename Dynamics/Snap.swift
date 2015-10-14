//
//  Snap.swift
//  Dynamics
//
//  Created by Rafael Moura on 22/05/15.
//  Copyright (c) 2015 Rafael Moura. All rights reserved.
//

import UIKit

class Snap: UIViewController {
    
    @IBOutlet weak var greenBox: UIView!
    var animator:UIDynamicAnimator?
    var snap:UISnapBehavior?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animator = UIDynamicAnimator(referenceView: self.view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func handleTap(sender: UITapGestureRecognizer) {
        animator?.removeAllBehaviors()
        
        snap = UISnapBehavior(item: greenBox, snapToPoint: sender.locationInView(self.view))
        snap?.damping = 0.2
        
        animator?.addBehavior(snap!)
        
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
