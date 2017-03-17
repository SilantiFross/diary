//
//  SecondViewController.swift
//  diary
//
//  Created by Admin on 14.03.17.
//  Copyright © 2017 Admin. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableViewStock: UITableView!
    
    var stocks = [StockInfo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(SecondViewController.refresh(refreshControl:)), for: UIControlEvents.valueChanged)
        tableViewStock.refreshControl = refreshControl
        view.addSubview(tableViewStock)
        
        parceFromUrl(url: "https://finance.yahoo.com/webservice/v1/symbols/allcurrencies/quote?format=json")
    }
    
    func refresh(refreshControl: UIRefreshControl) {
        stocks.removeAll()
        parceFromUrl(url: "https://finance.yahoo.com/webservice/v1/symbols/allcurrencies/quote?format=json")
        refreshControl.endRefreshing()
    }
    
    func parceFromUrl(url: String) {
        Alamofire.request(url).responseJSON{ response in
            
            if (response.result.value != nil) {
                let json = response.result.value as! NSDictionary
                let list = json["list"] as! NSDictionary
                let resources = list["resources"] as! NSArray
                
                for resource in resources {
                    let res = resource as! NSDictionary
                    let stock = res["resource"] as! NSDictionary
                    let stockInfo = stock["fields"] as! NSDictionary
                    
                    self.stocks.append(
                        StockInfo(
                            name: stockInfo["name"] as! String,
                            price: stockInfo["price"] as! String
                        )
                    )
                }
                self.tableViewStock.reloadData()
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stocks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableViewStock.dequeueReusableCell(withIdentifier: "StockCell", for: indexPath) as! StockCell
        
        cell.labelName.text = stocks[indexPath.row].name
        cell.labelPrice.text = stocks[indexPath.row].price
        
        return cell
    }
}
