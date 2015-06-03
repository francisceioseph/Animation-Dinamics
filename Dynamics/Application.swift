//
//  Application.swift
//  Dynamics
//
//  Created by Rafael Moura on 22/05/15.
//  Copyright (c) 2015 Rafael Moura. All rights reserved.
//

import UIKit

class Application: UIViewController {

    var alertView: UIView!
    var animator: UIDynamicAnimator?
    var attachment: UIAttachmentBehavior?
    
    @IBOutlet var overLayView: UIView!
    
    @IBAction func showAlert(sender: UIButton) {
        
        createAlert()
        
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            self.overLayView.alpha = 0.7
        })
        
        let snap = UISnapBehavior(item: alertView, snapToPoint: view.center)
        snap.damping = 0.3
        animator?.addBehavior(snap)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        animator = UIDynamicAnimator(referenceView: view)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismissAlert(){
    
        self.animator?.removeAllBehaviors()
        
        let gravity = UIGravityBehavior(items: [alertView])
        let dynamicItem = UIDynamicItemBehavior(items: [alertView])
        dynamicItem.addAngularVelocity(CGFloat(-M_PI_2), forItem: alertView)
        
        gravity.gravityDirection = CGVector(dx: 0.0, dy: 10.0)
        
        animator?.addBehavior(gravity)
        animator?.addBehavior(dynamicItem)
        
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            self.alertView.alpha = 0.0
            self.overLayView.alpha = 0.0
        }, completion: { (value: Bool) -> Void in
            self.alertView.removeFromSuperview()
            self.alertView = nil
        })
    }
    
    func createAlert(){
        
        alertView = UIView(frame: CGRect(x: 0, y: 0, width: 300.0, height: 200.0))
        alertView?.backgroundColor = UIColor(red: 0.0, green: 122/255.0, blue: 1.0, alpha: 1.0)
        alertView?.layer.cornerRadius = 10.0
        alertView?.layer.shadowColor = UIColor.lightGrayColor().CGColor
        alertView?.layer.shadowOffset = CGSize(width: 0, height: 5)
        alertView?.layer.shadowOpacity = 0.4
        alertView?.layer.shadowRadius = 10.0
        
        let button: UIButton = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        button.setTitle("Dismiss", forState: UIControlState.Normal)
        button.frame = CGRect(x: 0, y: 0, width: alertView.frame.width, height: 40.0)
        button.backgroundColor = UIColor.whiteColor()
        
        button.addTarget(self, action: Selector("dismissAlert"), forControlEvents: UIControlEvents.TouchUpInside)
        
        alertView.addSubview(button)
        view.addSubview(alertView)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: Selector("panHandler:"))
        view.addGestureRecognizer(panGesture)
    }
    
    func panHandler(sender: UIPanGestureRecognizer){
        
        if alertView != nil{
            
            let panLocationInView = sender.locationInView(view)
            let panLocationInAlertView = sender.locationInView(alertView)
            
            if sender.state == UIGestureRecognizerState.Began{
                animator?.removeAllBehaviors()
                
                let offSet = UIOffset(horizontal: panLocationInAlertView.x - CGRectGetMidX(alertView.frame), vertical: panLocationInAlertView.y - CGRectGetMidY(alertView.frame))
                attachment = UIAttachmentBehavior(item: alertView, offsetFromCenter: offSet, attachedToAnchor: alertView.center)
                animator?.addBehavior(attachment)
                
            }else if sender.state == UIGestureRecognizerState.Changed{
                attachment?.anchorPoint = panLocationInView
                
            }else if sender.state == UIGestureRecognizerState.Ended{
                
                animator?.removeAllBehaviors()
                
                let snapBehavior = UISnapBehavior(item: alertView, snapToPoint: view.center)
                animator?.addBehavior(snapBehavior)
                
                if sender.translationInView(view).y > 100 {
                    dismissAlert()
                }
            }
        }
        
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
