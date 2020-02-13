//
//  UIStoryboardExtension.swift
//  moovi
//
//  Created by tunay alver on 14.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

extension UIStoryboard {
    
    func instantiateViewController<T: UIViewController>() -> T {
        return self.instantiateViewController(withIdentifier: T.identifier) as! T
    }
    
}
