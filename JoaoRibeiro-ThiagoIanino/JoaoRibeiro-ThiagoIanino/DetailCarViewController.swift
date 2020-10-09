//
//  DetailCarViewController.swift
//  JoaoRibeiro-ThiagoIanino
//
//  Created by andre on 09/10/20.
//  Copyright © 2020 joao. All rights reserved.
//

import UIKit

class DetailCarViewController: UIViewController {
    
    @IBOutlet weak var detailTableView: UITableView!
    
    var car: Car?
    var carDetails: [String] = ["Cor", "Acabamento", "Assento de couro", "Acabamento assento"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailTableView.dataSource = self
        detailTableView.isScrollEnabled = false
        detailTableView.allowsSelection = false
        
        if let car = car {
            print(car)
        }
    }
}

extension DetailCarViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = carDetails[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        return cell
    }
}
