//
//  GravityCollision.swift
//  Dynamics
//
//  Created by Rafael Moura on 22/05/15.
//  Copyright (c) 2015 Rafael Moura. All rights reserved.
//

import UIKit

class GravityCollision: UIViewController {
    
    @IBOutlet weak var orangeBox: UIView!
    @IBOutlet weak var redBox: UIView!
    @IBOutlet weak var barrier1: UIView!
    @IBOutlet weak var barrier2: UIView!
    
    var animator: UIDynamicAnimator?
    var gravity: UIGravityBehavior?
    var collision:UICollisionBehavior?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gravity = UIGravityBehavior(items: [orangeBox, redBox])
        
        collision = UICollisionBehavior(items: [orangeBox, redBox])
        collision?.translatesReferenceBoundsIntoBoundary = true
        
        let finalPoint = CGPoint(x: barrier1.frame.origin.x + barrier1.frame.width, y: barrier1.frame.origin.y)
        collision?.addBoundaryWithIdentifier("barrier01", fromPoint: barrier1.frame.origin, toPoint: finalPoint)
        
        let finalPoint2 = CGPoint(x: barrier2.frame.origin.x + barrier2.frame.width, y: barrier2.frame.origin.y)
        collision?.addBoundaryWithIdentifier("barrier02", fromPoint: barrier2.frame.origin, toPoint: finalPoint2)
        
        animator = UIDynamicAnimator(referenceView: self.view)
        animator?.addBehavior(gravity!)
        animator?.addBehavior(collision!)
        
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
