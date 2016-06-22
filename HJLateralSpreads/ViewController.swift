//
//  ViewController.swift
//  HJLateralSpreads
//
//  Created by 王木木 on 16/6/22.
//  Copyright © 2016年 王木木. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var naviG: UINavigationController!
    
    var btnnn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let viewOne = UIView.init(frame: self.view.bounds)
        
        viewOne.backgroundColor = UIColor.yellowColor()
        
        btnnn = UIButton.init(frame: CGRectMake(0, 100, 100, 100))
        
        btnnn.backgroundColor = UIColor.blueColor()
        
        btnnn.addTarget(self,
                        action: #selector(self.touchBtn),
                        forControlEvents: .TouchUpInside)
        
        viewOne.addSubview(btnnn)
        
        self.view.addSubview(viewOne)
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        let aone = oneViewController()
        
        let nav = UINavigationController.init(rootViewController:aone )
        
        aone.navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "左", style: .Bordered,
                                                                     target: self,
                                                                     action: #selector(self.leftTOuch))
        
        naviG = nav
        self.addChildViewController(nav)
        
        self.view.addSubview(nav.view)
        
        //        let  panGestureRecognizer = UIPanGestureRecognizer.init(target: self, action: #selector(self.touchNar(_:)))
        //
        //        self.naviG.view.addGestureRecognizer(panGestureRecognizer)
    }
    
    func touchBtn(){
        
        UIView.animateWithDuration(0.2, animations: {
            let scaleForm = CGAffineTransformMakeScale(1, 1)
            
            let translateForm = CGAffineTransformTranslate(scaleForm,
                UIScreen.mainScreen().bounds.size.width,
                0)
            
            self.naviG.view.transform = translateForm
            
            
        }) { (block) in
            
            UIView.animateWithDuration(0.5, animations: {
                
                self.naviG.view.transform = CGAffineTransformIdentity
                let two = TwoViewController()
                
                two.view.backgroundColor = UIColor.redColor()
                
                self.naviG.pushViewController(two, animated: false)
                
                self.btnnn.removeFromSuperview()
            })
            
        }
        
    }
    
    func leftTOuch(){
        
        UIView.animateWithDuration(0.5) {
            
            let navH = UIScreen.mainScreen().bounds.size.height - 0
            
            let scale = navH / UIScreen.mainScreen().bounds.size.height
            
            let leftMenuMargin = UIScreen.mainScreen().bounds.size.width * (1 - scale) * 0.5
            
            let translateX = 300 - leftMenuMargin
            
            let topMargin = UIScreen.mainScreen().bounds.size.height * (1 - scale) * 0.5
            
            let translateY = topMargin - 0
            
            let scaleForm = CGAffineTransformMakeScale(1, 1)
            
            let translateForm = CGAffineTransformTranslate(scaleForm,
                                                           translateX / scale, -translateY / scale)
            
            self.naviG.view.transform = translateForm
            
            self.btnnn  = UIButton.init(frame: self.view.bounds)
            
            self.btnnn.addTarget(self,
                                 action: #selector(self.coverClick(_:)),
                                 forControlEvents: .TouchUpInside)
            
            self.btnnn.backgroundColor = UIColor.clearColor()
            
            self.naviG.view.addSubview(self.btnnn)
            
        }
        
    }
    
    func coverClick(btn:UIButton){
        
        UIView.animateWithDuration(0.3) {
            
            self.naviG.view.transform = CGAffineTransformIdentity
            
            self.btnnn.removeFromSuperview()
            
        }
        
    }
    
    
    //    func touchNar(pan:UIPanGestureRecognizer){
    //
    //        print(self.naviG.view.frame.origin.x)
    //
    //        if self.naviG.view.frame.origin.x < 0 {
    //            return
    //
    //        }
    //
    //        if (pan.view!.center.x - UIScreen.mainScreen().bounds.size.width/2) > 0 || (pan.view!.center.x - UIScreen.mainScreen().bounds.size.width/2) == 0  {
    //            let translation = pan.translationInView(self.view)
    //
    //
    //            let width = self.naviG.view.frame.origin.x + 1
    //            pan.view!.center = CGPointMake(translation.x+(UIScreen.mainScreen().bounds.size.width/2), pan.view!.center.y)
    //        }else{
    //
    //
    //
    //            return
    //
    //        }
    
    //
    //        print(translation.x)
    //        print(translation.y)
    //       pan.setTranslation(CGPointZero, inView: self.view)
    //      let point =  pan.velocityInView(self.view)
    //        print(point.x)
    //        print(point.y)
    //        print(UIScreen.mainScreen().bounds.size.width/2)
    //        print(pan.view!.center.x)
    
    //     print(pan.view?.bounds.origin.y)
    //    }
    
    
    
    
    //    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
    //        let evall = event?.allTouches()as!NSSet
    //
    //
    //        let touch = evall.anyObject()
    //
    //     let point =   touch?.locationInView(touch?.view)
    //
    //        print("x\(point?.x)-----y\(point?.y)")
    //
    //    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

