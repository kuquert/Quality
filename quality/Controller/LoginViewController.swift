//
//  ViewController.swift
//  quality
//
//  Created by Marcus Vinicius Kuquert on 2/29/16.
//  Copyright © 2016 Marcus Vinicius Kuquert. All rights reserved.
//

import UIKit
import AVFoundation

class LoginViewController: UIViewController {

    @IBOutlet weak var userField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    var trainer: Trainer?
    var player: AVPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func configureAppearance(){
        self.userField.layer.cornerRadius = 5
        self.userField.layer.borderWidth = 1
        self.userField.layer.borderColor = UIColor.whiteColor().CGColor
        self.userField.backgroundColor = UIColor(white: 1, alpha: 0.2)
        
        self.passwordField.layer.cornerRadius = 5
        self.passwordField.layer.borderWidth = 1
        self.passwordField.layer.borderColor = UIColor.whiteColor().CGColor
        self.passwordField.backgroundColor = UIColor(white: 1, alpha: 0.5)
        
        let verticalMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.y", type: .TiltAlongVerticalAxis)
        verticalMotionEffect.minimumRelativeValue = -100
        verticalMotionEffect.maximumRelativeValue = 100
        
        let horizontalMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.x", type: .TiltAlongHorizontalAxis)
        verticalMotionEffect.minimumRelativeValue = 100
        verticalMotionEffect.maximumRelativeValue = -100
        
        
        let group = UIMotionEffectGroup()
        group.motionEffects = [horizontalMotionEffect, verticalMotionEffect]
        self.userField.addMotionEffect(horizontalMotionEffect)
        self.passwordField.addMotionEffect(verticalMotionEffect)
        
    }
    
    func configVideoBackground(){
        let path = NSBundle.mainBundle().pathForResource("intro", ofType: "mp4")
        self.player = AVPlayer(URL: NSURL(fileURLWithPath: path!))
        let playerLayer = AVPlayerLayer(player: player)
        
        playerLayer.frame = self.view.frame
        playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        
        self.view.layer.insertSublayer(playerLayer, atIndex: 0)
        self.player!.seekToTime(kCMTimeZero)
        self.player!.play()
        
        //TODO Remove notification observer
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "playerItemDidReachEnd", name: AVPlayerItemDidPlayToEndTimeNotification, object: player!.currentItem)
    }
    
    func playerItemDidReachEnd(){
        self.player!.seekToTime(kCMTimeZero)
    }

    @IBAction func loginButton(sender: UIButton) {
        let user = userField.text
        let password = passwordField.text
        
        APIManager.login(user: user!, password: password!) { (success, error, trainer) -> () in
            if success{
                self.trainer = trainer
                self.performSegueWithIdentifier("showProfile", sender: nil)
            }else{
                print(error)
                let alertController = UIAlertController(title: "Wrong Credentials", message: "Check your username and/or password and try again", preferredStyle: .Alert)
                
                let cancelAction = UIAlertAction(title: "OK", style: .Destructive, handler: nil)
                alertController.addAction(cancelAction)
                
                self.presentViewController(alertController, animated: true, completion: nil)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if let navigationController  = segue.destinationViewController as? UINavigationController{
//            if let vc = navigationController.viewControllers.first as? ProfileViewController{
//                vc.trainer = self.trainer
//            }
//        }
//    }

}