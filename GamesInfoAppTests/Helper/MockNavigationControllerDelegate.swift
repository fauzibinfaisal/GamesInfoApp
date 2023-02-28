//
//  MockNavigationControllerDelegate.swift
//  GamesInfoAppTests
//
//  Created by Gop-c2s2-f on 28/02/23.
//

import Foundation
import UIKit

class MockNavigationControllerDelegate: NSObject, UINavigationControllerDelegate {
    var lastPushedViewController: UIViewController?
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        lastPushedViewController = viewController
    }
}
