//
//  ViewController.swift
//  quality
//
//  Created by Marcus Vinicius Kuquert on 2/29/16.
//  Copyright © 2016 Marcus Vinicius Kuquert. All rights reserved.
//

import UIKit
import Alamofire
import Gloss
import Foundation

class LoginViewController: UIViewController {

    @IBOutlet weak var userField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    var trainer: Trainer?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func loginButton(sender: UIButton) {
        
        let url = "http://server03.local:60080/login"
        let user = userField.text
        let password = passwordField.text
        
        Alamofire.request(.GET, url, parameters: ["user" : user!, "password": password!], encoding: .URL, headers: nil).responseJSON{ response in
            if let js = response.result.value!["data"]{
                self.trainer = Trainer(json: js as! JSON)
                self.performSegueWithIdentifier("showProfile", sender: nil)
//                print(a?.onHandPokemons![0].status)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let navigationController  = segue.destinationViewController as? UINavigationController{
            if let vc = navigationController.viewControllers.first as? ProfileViewController{
                vc.trainer = self.trainer
            }
        }
    }

}