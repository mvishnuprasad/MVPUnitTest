//
//  NavigationTest.swift
//  MVPUnitTestTests
//
//  Created by vishnuprasadm on 19/07/25.
//

import XCTest
@testable import MVPUnitTest
final class NavigationTest: XCTestCase {
    var sut: SignupVC!
    var navigationController: UINavigationController!
    override func setUpWithError() throws {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyBoard.instantiateViewController(withIdentifier: "SignupVC") as? SignupVC
        sut.loadViewIfNeeded()
        navigationController = UINavigationController(rootViewController: sut)
    }

    override func tearDownWithError() throws {
        sut = nil
        navigationController=nil
    }
    func testViewButton_WhenTapped_LoadSecondVC() {
        sut.termsButton.sendActions(for: .touchUpInside)
        guard let _ = navigationController.topViewController as? TermsVC else {
            XCTFail("Not Terms VC")
            return
        }
    }
    func testViewButton_WhenTapped_LoadSecondVC2() {
        let spyVC = SpyVC(rootViewController: sut)
        sut.termsButton.sendActions(for: .touchUpInside)
        guard let _ = spyVC.topViewController as? TermsVC else {
            XCTFail("Not Terms VC \(spyVC.pushedVC)")
            return
        }
    }
     
}
