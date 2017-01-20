//
//  Util.swift
//  Desafio Mongeral
//
//  Created by Marco Marques on 17/01/17.
//  Copyright © 2017 Marco Henrique Maia Marques. All rights reserved.
//

import Foundation
import UIKit


class Util: NSObject {
    
    
    
    func downloaderImage(url: String?) -> UIImage? {
        guard let url = url,
            let imageUrl = NSURL(string: url),
            let data = NSData(contentsOf: imageUrl as URL)
            else { return nil }
        
        return UIImage(data: data as Data)
    }
    
    
    
}
