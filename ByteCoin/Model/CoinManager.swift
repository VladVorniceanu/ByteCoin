//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate{
    func didUpdateCoin(_ coinManager: CoinManager, _ coinStatus: CoinStatus)
    func didFailWithError(_ error: Error)
}

struct CoinManager{
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC/"
    var coinApiKey = CoinApiKey()
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    var delegate : CoinManagerDelegate?

    func getCoinPrice(for currency: String) {
        let urlString = "\(baseURL)\(currency)?apiKey=\(coinApiKey.apiKey)"
        performRequest(urlString)
    }
    
    func performRequest(_ urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) {data, response, error in
                if error != nil {
                    self.delegate?.didFailWithError(error!)
                    return
                }
                if let safeData = data {
                    if let coin = self.parseJSON(safeData) {
                        self.delegate?.didUpdateCoin(self, coin)
                    }
                }
            }
            
            task.resume()
        }
    }
    func parseJSON(_ coinData: Data) -> CoinStatus?{
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoinStatus.self, from: coinData)
            let coin_id = decodedData.asset_id_base
            let currency = decodedData.asset_id_quote
            let rate = decodedData.rate
            let coin = CoinStatus(asset_id_base: coin_id, asset_id_quote: currency, rate: rate)
            
            return coin
        } catch {
            delegate?.didFailWithError(error)
            return nil;
        }
    }
}
