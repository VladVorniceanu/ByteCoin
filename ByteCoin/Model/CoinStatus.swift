//
//  CoinStatus.swift
//  ByteCoin
//
//  Created by Vlad Vorniceanu on 26.02.2024.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

struct CoinStatus: Codable {
    let asset_id_base: String
    let asset_id_quote: String
    let rate: Float
    
}
