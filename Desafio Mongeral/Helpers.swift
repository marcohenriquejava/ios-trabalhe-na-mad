	//
//  Helpers.swift
//  Desafio Mongeral
//
//  Created by Marco Marques on 23/01/17.
//  Copyright © 2017 Marco Henrique Maia Marques. All rights reserved.
//

import UIKit
    
    
class CSHelperDate {
    private static var _timestampFormatter: DateFormatter = DateFormatter()
    private static var _brDateFormatter: DateFormatter = DateFormatter()
        
    class var timestampFormatter:DateFormatter {
        _timestampFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return self._timestampFormatter
    }
        
    class var formatterBR:DateFormatter {
        _brDateFormatter.dateFormat = "dd/MM/YYYY"
        return self._brDateFormatter
    }
}
    
class CSHelpers {
    class func makeRounded(imageView:UIImageView) {
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.lightGray.cgColor
    }
        
class func loadJSON(forFilename fileName: String) -> [String : Any]? {
        if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let jsonObj = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any]
                return jsonObj
            } catch let error {
                print(error.localizedDescription)
            }
        } else {
            print(">> Failed to loading JSON file of name: \(fileName)")
        }
        return nil
    }
    
}
    
    
    
class AlertFun {
    
    class func ShowAlert(title: String, message: String, in vc: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        vc.present(alert, animated: true, completion: nil)
    }
}
