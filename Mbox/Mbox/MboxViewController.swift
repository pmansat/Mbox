//
//  MboxViewController.swift
//  Mbox
//
//  Created by Promeet Mansata on 10/24/15.
//  Copyright © 2015 Promeet Mansata. All rights reserved.
//
// brown BF9F7E; grey DCDFE0 ; yellow FFE066; green 55D959; red F24D44;


import UIKit

class MboxViewController: UIViewController, UIScrollViewDelegate , UIGestureRecognizerDelegate{

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var messageImageView: UIImageView!
    @IBOutlet weak var MessageContainerView: UIView!
    @IBOutlet weak var LaterImageView: UIImageView!
    @IBOutlet weak var ListImageView: UIImageView!
    @IBOutlet weak var ArchiveImageView: UIImageView!
    @IBOutlet weak var DeleteImageView: UIImageView!
    @IBOutlet weak var MenuImage: UIImageView!
    
    @IBOutlet weak var RescheduleImageView: UIImageView!
    @IBOutlet var EdgeGesture: UIScreenEdgePanGestureRecognizer!
    
    @IBOutlet var onTap: UITapGestureRecognizer!
    // Define Variables
    var messageInitialFrame: CGPoint!
    var laterInitialFrame: CGPoint!
    var listInitialFrame: CGPoint!
    var archiveInitialFrame: CGPoint!
    var deleteInitialFrame: CGPoint!
    var frictionDrag: CGFloat!

    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        // This method is called as the user scrolls
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
       
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView,
        willDecelerate decelerate: Bool) {
      }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
    }
    
    
    override func viewDidLoad() {
        scrollView.delegate = self
        scrollView.contentSize = imageView.image!.size
        LaterImageView.hidden = false
        ArchiveImageView.hidden = true
        DeleteImageView.hidden = true
        
        // The onCustomPan: method will be defined in Step 3 below.
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: "onCustomPan:")
        
        // Attach it to a view of your choice. If it's a UIImageView, remember to enable user interaction
             messageImageView.addGestureRecognizer(panGestureRecognizer)
        
        messageInitialFrame = messageImageView.frame.origin
        laterInitialFrame = LaterImageView.frame.origin
        listInitialFrame = ListImageView.frame.origin
        archiveInitialFrame = ArchiveImageView.frame.origin
        deleteInitialFrame = DeleteImageView.frame.origin
        frictionDrag = 10
        
        let EdgeGestureRecognizer = UIScreenEdgePanGestureRecognizer(target: self, action: "onEdgePan:")
        EdgeGestureRecognizer.edges = UIRectEdge.Left
        
        super.viewDidLoad()
    }

    
    func UIColorFromHex(rgbValue:UInt32, alpha:Double=1.0)->UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        
        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }
    
    func onCustomPan(panGestureRecognizer: UIPanGestureRecognizer) {
        
        // Reset all Icons to be hidden
        LaterImageView.hidden = true
        ArchiveImageView.hidden = true
        DeleteImageView.hidden = true
        
        // Absolute (x,y) coordinates in parent view
        let point = panGestureRecognizer.locationInView(view)
        
        // Relative change in (x,y) coordinates from where gesture began.
        var translation = panGestureRecognizer.translationInView(view)
        var velocity = panGestureRecognizer.velocityInView(view)
        
        if panGestureRecognizer.state == UIGestureRecognizerState.Began {
            // print("Gesture began at: \(point)")
            // print("Translation: \(translation)")
            // print("Velocity: \(velocity)")
            
            
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Changed {
            print("Translation: \(translation)")
             messageImageView.frame.origin.x = CGFloat(messageInitialFrame.x + translation.x)
  
            
            
// Left side views 
// ArchiveImageView (first one that appears)
// DeleteImageView (second one that appears)
            
     
            if translation.x > 0 && translation.x <= 60 {
                MessageContainerView.backgroundColor = UIColorFromHex(0xDCDFE0, alpha:1.0)
                ArchiveImageView.hidden = false
                
            } else if translation.x > 60 && translation.x <= 260 {
                MessageContainerView.backgroundColor = UIColorFromHex(0x55D959, alpha: 1.0)
                ArchiveImageView.hidden = false
                
            } else if translation.x > 260 && translation.x <= 280 {
                MessageContainerView.backgroundColor = UIColorFromHex(0xF24D44, alpha: 1.0)
                ArchiveImageView.hidden = true
                DeleteImageView.hidden = false
            
            } else if translation.x > 290 {
                    MessageContainerView.backgroundColor = UIColorFromHex(0xF24D44, alpha: 1.0)
                    ArchiveImageView.hidden = true
                    DeleteImageView.hidden = false
                    RescheduleImageView.alpha = 1

                
// Left side views
                
                
            } else if translation.x > -60 && translation.x < 0 {
                MessageContainerView.backgroundColor = UIColorFromHex(0xDCDFE0, alpha: 1.0)
                if translation.x < -30 {LaterImageView.hidden = false}
                
            } else if translation.x > -280 && translation.x < -60 {
                MessageContainerView.backgroundColor = UIColorFromHex(0xFFE066, alpha: 1.0)
                LaterImageView.hidden = false
                
            } else if translation.x < -280 {
                MessageContainerView.backgroundColor = UIColorFromHex(0xBF9F7E, alpha: 1.0)
                LaterImageView.hidden = false
                
            }
            
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Ended {
            if translation.x > -300 && translation.x < 300 {
            LaterImageView.hidden = false
                DeleteImageView.hidden = false }
                else if translation.x > 305 {
                    LaterImageView.hidden = false
                    DeleteImageView.hidden = false
                    RescheduleImageView.alpha = 1 }
            }
            

            
            }
    
    @IBAction func onTap(sender: AnyObject) {
        RescheduleImageView.alpha = 0
            }
    
        }

