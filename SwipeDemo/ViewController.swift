//
//  ViewController.swift
//  SwipeDemo
//
//  Created by Fraschetti on 08/12/16.
//  Copyright © 2016 Nomad Software House. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel(frame: CGRect(x: self.view.bounds.width/2 - 100, y: self.view.bounds.height/2 - 50, width: 200, height: 100))
        
        label.text = "drag me!"
        
        label.font = label.font.withSize(25)
        
        label.textAlignment = NSTextAlignment.center
        
        view.addSubview(label)
        
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(wasDragged(gestureRecognizer:)))
        
        label.isUserInteractionEnabled = true
        
        label.addGestureRecognizer(gesture)
        
    }
    
    
    func wasDragged(gestureRecognizer: UIPanGestureRecognizer) {
        
        let translation = gestureRecognizer.translation(in: view)
        
        let label = gestureRecognizer.view!
        
        label.center = CGPoint(x: self.view.bounds.width / 2 + translation.x, y: self.view.bounds.height / 2 + translation.y)
        
        let xFromCenter = label.center.x - self.view.bounds.width / 2
        
        let scale = min(abs(100 / xFromCenter), 1)
        
        var rotation = CGAffineTransform(rotationAngle: xFromCenter / 200)
        print(rotation)
        
        var strechAndRotation = rotation.scaledBy(x: scale, y: scale)
        
        
        
        label.transform = strechAndRotation
        
        if gestureRecognizer.state == UIGestureRecognizerState.ended {
            
            if label.center.x < 100 {
                
                print("Not choosen")
                
            } else if label.center.x > self.view.bounds.width - 100 {
                
                print("choosen")
                
            }
            
            rotation = CGAffineTransform(rotationAngle: 0)
            
            strechAndRotation = rotation.scaledBy(x: 1, y: 1)
            
            label.transform = strechAndRotation
            
            label.center = CGPoint(x: self.view.bounds.width/2, y: self.view.bounds.height/2)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

