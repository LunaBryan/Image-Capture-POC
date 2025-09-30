//
//  Router.swift
//  Image-Capture-POC
//
//  Created by Jose Luna on 9/26/25.
//

import UIKit

protocol Router {
    associatedtype Route
    
    var navigationController: UINavigationController? { get }
    
    func process(_ route: Route)
    func exit()
}
