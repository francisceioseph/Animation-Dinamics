//
//  Attach.swift
//  Dynamics
//
//  Created by Rafael Moura on 22/05/15.
//  Copyright (c) 2015 Rafael Moura. All rights reserved.
//

import UIKit

class Attach: UIViewController {

    var animator: UIDynamicAnimator?
    var attach: UIAttachmentBehavior?
    var gravity: UIGravityBehavior?
    
    @IBOutlet var anchor: UIView!
    @IBOutlet var blueBox: UIView!
    
    @IBAction func panHandler(sender: UIPanGestureRecognizer) {
        
        let panLocation = sender.locationInView(self.view)
        attach?.anchorPoint = panLocation
        anchor.center = panLocation
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        gravity = UIGravityBehavior(items: [blueBox])
        attach = UIAttachmentBehavior(item: self.blueBox, attachedToAnchor: CGPoint(x: self.anchor.center.x, y: self.anchor.center.y))
        animator = UIDynamicAnimator(referenceView: self.view)
        animator?.addBehavior(gravity)
        animator?.addBehavior(attach)
        
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
