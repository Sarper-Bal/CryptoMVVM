//
//  WebService.swift
//  CryptoMVVM
//
//  Created by Sarper Bal on 2.06.2023.
//

import Foundation

class WebService {
    func downloadCurrencies(url : URL, completion : @escaping ([CryptoCurrency]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }else if let data = data {
                let cryptoList = try? JSONDecoder().decode([CryptoCurrency].self, from: data)
                
                print(cryptoList)
                completion(cryptoList)
            }
        }.resume()
        
    }
}
