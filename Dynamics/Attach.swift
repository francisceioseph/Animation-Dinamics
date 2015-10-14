//
//  Attach.swift
//  Dynamics
//
//  Created by Rafael Moura on 22/05/15.
//  Copyright (c) 2015 Rafael Moura. All rights reserved.
//

import UIKit

class Attach: UIViewController {

    @IBOutlet weak var yellowBox: UIView!
    @IBOutlet weak var blueBox: UIView!
    
    var animator: UIDynamicAnimator?
    var attach: UIAttachmentBehavior?
    var gravity: UIGravityBehavior?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animator = UIDynamicAnimator(referenceView: self.view)
        
        attach = UIAttachmentBehavior(item: yellowBox, attachedToAnchor: blueBox.center)
        attach?.frequency = 1.0
        attach?.length = CGFloat(100.0)
        gravity = UIGravityBehavior(items: [yellowBox])
        
        animator?.addBehavior(attach!)
        animator?.addBehavior(gravity!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func panHandler(sender: UIPanGestureRecognizer) {
        let panLocation = sender.locationInView(view)
        blueBox.center = panLocation;
        attach?.anchorPoint = panLocation
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
