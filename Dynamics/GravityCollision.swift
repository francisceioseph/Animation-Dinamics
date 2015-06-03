//
//  GravityCollision.swift
//  Dynamics
//
//  Created by Rafael Moura on 22/05/15.
//  Copyright (c) 2015 Rafael Moura. All rights reserved.
//

import UIKit

class GravityCollision: UIViewController, UICollisionBehaviorDelegate {

    var animator: UIDynamicAnimator?
    var gravity: UIGravityBehavior?
    var collicion: UICollisionBehavior?
    var dynamicItem: UIDynamicItemBehavior?
    
    @IBOutlet var blueBox: UIView!
    @IBOutlet var redBarrier: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animator = UIDynamicAnimator(referenceView: self.view)
        gravity = UIGravityBehavior(items: [self.blueBox])
        collicion = UICollisionBehavior(items: [self.blueBox, self.redBarrier])
        dynamicItem = UIDynamicItemBehavior(items: [self.blueBox])
//        dynamicItem?.allowsRotation = false
//        dynamicItem?.elasticity = 0.8
        
//      >>>>>>>>> Define os pontos de contato nos limites da view e da barra vermelha <<<<<<<
        let rightPoint = CGPoint(x: self.redBarrier.frame.origin.x + self.redBarrier.frame.width,y: self.redBarrier.frame.origin.y)
        collicion?.addBoundaryWithIdentifier("barrier", fromPoint: self.redBarrier.frame.origin, toPoint: rightPoint)
        collicion?.translatesReferenceBoundsIntoBoundary = true
        
//      >>>>>> Assina o Delegate <<<<<<<<<
        collicion?.collisionDelegate = self
        
        animator?.addBehavior(gravity)
        animator?.addBehavior(collicion)
        animator?.addBehavior(dynamicItem)
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

    // MARK: - Collision Behavior Delegate
    
    func collisionBehavior(behavior: UICollisionBehavior, beganContactForItem item1: UIDynamicItem, withItem item2: UIDynamicItem, atPoint p: CGPoint) {
        
        
        
    }
    
    func collisionBehavior(behavior: UICollisionBehavior, beganContactForItem item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying, atPoint p: CGPoint) {
        
        let identifier: NSCopying? = identifier
        
        if let identifier = identifier{
            if identifier as? String == "barrier"{
                println("Barreira: Ponto \(p)")
            }
        }else{
            println("Limites da View: Ponto: \(p)")
        }
    }
    
    
    func collisionBehavior(behavior: UICollisionBehavior, endedContactForItem item1: UIDynamicItem, withItem item2: UIDynamicItem) {
        
    }
    
    func collisionBehavior(behavior: UICollisionBehavior, endedContactForItem item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying) {
        
    }
    
}
