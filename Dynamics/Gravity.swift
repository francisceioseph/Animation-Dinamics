//
//  Gravity.swift
//  Dynamics
//
//  Created by Rafael Moura on 03/06/15.
//  Copyright (c) 2015 Rafael Moura. All rights reserved.
//

import UIKit

class Gravity: UIViewController {

    @IBOutlet weak var yellowBox: UIView!
    @IBOutlet weak var blueBox: UIView!
    @IBOutlet weak var purpleBox: UIView!
    
    var animator: UIDynamicAnimator?
    var gravity: UIGravityBehavior?
    
    var animator2: UIDynamicAnimator?
    var gravity2: UIGravityBehavior?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gravity = UIGravityBehavior(items: [yellowBox])
        gravity?.gravityDirection = CGVector(dx: 0, dy: 0.2)
        
        gravity2 = UIGravityBehavior(items: [ blueBox, purpleBox])
        gravity2?.gravityDirection = CGVector(dx: 0, dy: 0.4)

        
        animator = UIDynamicAnimator(referenceView: self.view)
        animator?.addBehavior(gravity!)
        
        animator2 = UIDynamicAnimator(referenceView: self.view)
        animator2?.addBehavior(gravity2!)
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
