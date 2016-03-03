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
    private var selectedPokemon: Pokemon?
    let trainer = APIManager.sharedInstance.currentTrainer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableFooterView = UIView()
        self.nameLabel.text = self.trainer.name        
        let imageData = NSData(contentsOfURL: NSURL(string: (trainer.photo))!)
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
        selectedPokemon = trainer.onHandPokemons?[indexPath.row]
        self.performSegueWithIdentifier("showDetail", sender: nil)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("pokemonCell", forIndexPath: indexPath) as! PokemonTableViewCell
        
        let pokemon = (trainer.onHandPokemons?[indexPath.row])!
        let url = pokemon.icon
        let imageData = NSData(contentsOfURL: NSURL(string: url)!)
        
        cell.typesLabel?.text = pokemon.type2 != nil ? "\(pokemon.type1) , \(pokemon.type2!)" : "\(pokemon.type1)"
        cell.nameLabel?.text = pokemon.name
        cell.levelLabel?.text = "Level \(pokemon.level)"
        cell.numberLabel?.text = "\(pokemon.number)"
        cell.cellImageView?.image = UIImage(data: imageData!)
        
        return cell
    }
}

