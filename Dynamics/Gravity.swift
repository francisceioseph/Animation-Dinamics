//
//  Gravity.swift
//  Dynamics
//
//  Created by Rafael Moura on 03/06/15.
//  Copyright (c) 2015 Rafael Moura. All rights reserved.
//

import UIKit

class Gravity: UIViewController {

    @IBOutlet var blueBox: UIView!
    var animator: UIDynamicAnimator?
    var gravity: UIGravityBehavior?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        animator = UIDynamicAnimator(referenceView: self.view)
        gravity = UIGravityBehavior(items: [self.blueBox])
        
        animator?.addBehavior(gravity)
        
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
