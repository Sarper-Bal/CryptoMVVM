//
//  ViewController.swift
//  CryptoMVVM
//
//  Created by Sarper Bal on 1.06.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    private var cryptoLisViewModel : CryptoListViewMode!
    var colorArray =  [UIColor]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getData()
        
        self.colorArray = [
            UIColor(red: 50/255, green: 200/255, blue: 124/255, alpha: 1.0),
            UIColor(red: 99/255, green: 13/255, blue: 219/255, alpha: 1.0),
            UIColor(red: 1/255, green: 2/255, blue: 123/255, alpha: 1.0),
            UIColor(red: 200/255, green: 189/255, blue: 254/255, alpha: 1.0)
        ]
            
        
        
    }
    
    func getData() {
        
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!
        
        WebService().downloadCurrencies(url: url) { cryto in
            if let cryto = cryto {
                
                self.cryptoLisViewModel = CryptoListViewMode(cryptoCurrencyList: cryto)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cryptoLisViewModel == nil ? 0 : self.cryptoLisViewModel.numberOfRowInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCell", for: indexPath) as! CryptoTableViewCell
        
        let cryptoViewModel = self.cryptoLisViewModel.crytptoAtIndex(indexPath.row)
        
        cell.priceText.text = cryptoViewModel.price
        cell.currencyText.text = cryptoViewModel.name
        cell.backgroundColor = self.colorArray[indexPath.row % 4]
        
        return cell
    }


}

