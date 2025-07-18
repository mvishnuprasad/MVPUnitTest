//
//  SignUpFormValidatorTests.swift
//  MVPUnitTestTests
//
//  Created by vishnuprasadm on 18/07/25.
//

import Foundation

import XCTest
@testable import MVPUnitTest

final class SignInFormModelValidateTests: XCTestCase {
    
    var sut: SignUpFormValidator!
    
    override func setUp() {
        sut = SignUpFormValidator()
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func testSignUpFormModelValidateTests_FirsNameIsValid_ShouldReturnTrue(){
        //Arrange
        // Act
        
        let isFirstNameValid = sut.IsValidFirstName("vishnu")
        //Assert
        XCTAssertTrue(isFirstNameValid,"the IsValidFirstName() should return true if first name is valid else return false")
    }
    
    func testSignUpFormModelValidateTests_FirstNameIsVeryShort_ShouldReturnFalse(){
        let isFirstNameVeryShort = sut.IsValidFirstName("vp")
        
        // Assert
        XCTAssertFalse(isFirstNameVeryShort,"the IsValidFirstName() should return false if first name is less than (\(SignUpConstants.firstNameMinLength) else it return true ")
    }
    
    func testSignUpFormModelTests_FirstNameIsTooLong_ShouldReturnFalse(){
        //Arrange
        
        //Act
        let isShortFirstName = sut.IsValidFirstName("vishnuprasadmvishnuprasadm")
        
        XCTAssertFalse(isShortFirstName,"the IsValidFirstName() should return false if first name is too long and greater than (\(SignUpConstants.firstNameMaxLength) char but it return true ")
    }
    
    func testSignUpFormModelTests_PasswordIsValid_ShouldReturnTrue(){
        //Arrange
        //Act
        let isValidPassword = sut.isValidPassword(password: "vishnuprasad")
        // Assert
        XCTAssertTrue(isValidPassword,"the isValidPassword() should return true if password i passed is greater than (\(SignUpConstants.minPasswordLength)) char but it return false ")
        
    }
    
    func testSignUpFormModelTests_PasswordIsTooShort_ShouldReturnFalse(){
        let isValidPassword = sut.isValidPassword(password: "vpm")
        XCTAssertFalse(isValidPassword,"the isValidPassword() should return false if password i passed is less than (\(SignUpConstants.minPasswordLength)) char but it return true ")
        
    }
    
    func testSignUpFormModelTests_lastNameIsValid_ShouldReturnTrue(){
       
        let isValidLastName = sut.isValidLastNme(lastName: "prasad")
        
        XCTAssertTrue(isValidLastName, "the isValidLastNme() should return true if last name is valid  but it return false ")
    }
    
    func testSignUpFormModelTests_lastNameIstooShort_ShouldReturnFalse(){
       
        let isValidLastName = sut.isValidLastNme(lastName: "vp")
        XCTAssertFalse(isValidLastName, "the isValidLastNme() should return false if password i passed is less than (\(SignUpConstants.minPasswordLength)) char but it return true ")
    }
    
    func testSignUpFormModelTests_lastNameIstooLong_ShouldReturnFalse(){
        let isValidLastName = sut.isValidLastNme(lastName: "prasadmvishnu")
        XCTAssertFalse(isValidLastName, "the isValidLastNme() should return false if password i passed is less than (\(SignUpConstants.firstNameMaxLength)) char but it return true ")
    }
    
    func testSignUpFormModelTests_passwordIsMatched_ShouldReturnTrue() {
        
        //Arrange
        
        //Act
        let IsMatched = sut.IsPasswordMatched(password:"123456",Repeated:"123456")
        
        XCTAssertTrue(IsMatched, "the IsPasswordMatched() should return true if password match but it return false ")
        
    }
    
    func testSignUpFormModelTests_passwordIsNotMatched_ShouldReturnFalse() {
       
        let IsMatched = sut.IsPasswordMatched(password:"123456",Repeated:"1234")
        
        
        
        XCTAssertFalse(IsMatched, "the IsPasswordMatched() should return false if password not match but it return true ")
        
    }
    
}
