//
//  CrytoViewModel.swift
//  CryptoMVVM
//
//  Created by Sarper Bal on 2.06.2023.
//

import Foundation

struct CryptoListViewMode {
    let cryptoCurrencyList : [CryptoCurrency]
    
  /*
    func numberOfRowInSection() -> Int {
        return self.cryptoCurrencyList.count
    }
    
    func crytptoAtIndex(_ index: Int)  -> CrytoViewModel {
        let crypto = self.cryptoCurrencyList[index]
        return CrytoViewModel(cryptoCurrency: crypto)
    }
   */
}

extension CryptoListViewMode {
    
    func numberOfRowInSection() -> Int {
        return self.cryptoCurrencyList.count
    }
    
    func crytptoAtIndex(_ index: Int)  -> CrytoViewModel {
        let crypto = self.cryptoCurrencyList[index]
        return CrytoViewModel(cryptoCurrency: crypto)
    }
    
}

struct CrytoViewModel {
    let cryptoCurrency : CryptoCurrency
    
    var name : String {
        return self.cryptoCurrency.currency
    }
    
    var price : String {
        return self.cryptoCurrency.price
    }
}

