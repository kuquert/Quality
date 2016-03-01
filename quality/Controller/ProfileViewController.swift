//
//  ProfileViewController.swift
//  quality
//
//  Created by Marcus Vinicius Kuquert on 3/1/16.
//  Copyright © 2016 Marcus Vinicius Kuquert. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    internal var trainer: Trainer?
    private var selectedPokemon: Pokemon?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableFooterView = UIView()
        self.nameLabel.text = trainer?.name
//        trainer?.photo
        
        let imageData = NSData(contentsOfURL: NSURL(string: (trainer!.photo))!)
        self.photoImageView.image = UIImage(data: imageData!)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let vc = segue.destinationViewController as? DetailViewController{
           vc.pokemon = self.selectedPokemon
        }
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        selectedPokemon = trainer?.onHandPokemons?[indexPath.row]
        self.performSegueWithIdentifier("showDetail", sender: nil)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (trainer?.onHandPokemons?.count)!
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cell")
        let pokemon = trainer?.onHandPokemons?[indexPath.row]
        cell.textLabel?.text = pokemon?.name
        cell.detailTextLabel?.text = pokemon?.type1
        let url = pokemon?.icon
        let imageData = NSData(contentsOfURL: NSURL(string: url!)!)
        cell.imageView?.image = UIImage(data: imageData!)
        
        return cell
    }
}

