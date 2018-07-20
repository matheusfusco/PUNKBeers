//
//  HomeTableViewController.swift
//  PUNKBeers
//
//  Created by Matheus Pacheco Fusco on 10/07/2018.
//  Copyright © 2018 Fusco. All rights reserved.
//

import UIKit

final class HomeTableViewController: UITableViewController {

    private let model: HomeViewModel = HomeViewModel()
    private var currentPage: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        fetchBeers()
    }
    
    private func configureTableView() {
        self.tableView.tableFooterView = UIView()
        registerCell()
    }
    
    private func registerCell() {
        let nib = UINib.init(nibName: "BeerTableViewCell", bundle: Bundle(for: type(of: self)))
        self.tableView.register(nib, forCellReuseIdentifier: "beerTableViewCell")
    }

    private func fetchBeers() {
        model.fetchBeers(page: currentPage)
        model.fetch = { beersList, error in
            guard error == nil else {
                print(error!)
                return
            }
            self.tableView.reloadData()
        }
    }
    
    //MARK: - Memory Management
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.beers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "beerTableViewCell", for: indexPath) as! BeerTableViewCell
        cell.beer = model.beers[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == model.beers.count - 1 {
            currentPage += 1
            model.fetchBeers(page: currentPage)
        }
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showBeerDetailIdentifier", sender: self)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = self.tableView.indexPathForSelectedRow {
            let selectedBeer = model.beers[indexPath.row]
            if let detailVC = segue.destination as? BeerDetailViewController {
                detailVC.model.beer = selectedBeer
            }
        }
    }
}
