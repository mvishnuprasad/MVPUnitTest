//
//  MockUIViewController.swift
//  MVPUnitTestTests
//
//  Created by qbuser on 19/07/25.
//

import UIKit
class SpyVC : UINavigationController {
    var pushedVC : UIViewController!
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        pushedVC = viewController
    }
}
