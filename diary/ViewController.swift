//
//  ViewController.swift
//  diary
//
//  Created by Admin on 12.02.17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var games = [GameInfo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let parcer = JsonParcer()
        parcer.parceFromFile(forParce: &games, fileName: "games")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController: DescViewController = segue.destination as! DescViewController
        
        let cell = sender as! CustomCell
        
        viewController.gameInfo.name = cell.labelName.text!
        viewController.gameInfo.image = cell.imageGame.image!
        viewController.gameInfo.desc = cell.labelDescription.text!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "GameCell", for: indexPath) as! CustomCell
        
        cell.imageGame.image = games[indexPath.row].image
        cell.labelName.text = games[indexPath.row].name
        cell.labelDescription.text = games[indexPath.row].desc
        
        return cell
    }
}
