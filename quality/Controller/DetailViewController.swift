//
//  DetailViewController.swift
//  quality
//
//  Created by Marcus Vinicius Kuquert on 3/1/16.
//  Copyright © 2016 Marcus Vinicius Kuquert. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var pokemon: Pokemon?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameLabel.text = self.pokemon?.name
        
        let imageData = NSData(contentsOfURL: NSURL(string: (pokemon!.image))!)
        self.imageView.image = UIImage(data: imageData!)
        // Do any additional setup after loading the view.
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
