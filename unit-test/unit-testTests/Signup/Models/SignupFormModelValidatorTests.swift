//
//  SignupFormModelValidator.swift
//  unit-testTests
//
//  Created by Ted on 2021/04/18.
//

import XCTest
@testable import unit_test

class SignupFormModelValidatorTests: XCTestCase {
    
    var sut: SignupFormModelValidator!

    override func setUp() {
        sut = SignupFormModelValidator()
    }
    
    override func tearDown() {
        sut = nil
    }

    func testSignFormModelValidator_WhenValidFirstNameProvided_ShouldReturnTrue() {
        
        // Arrange
        // Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "Ted")
        
        // Assert
        XCTAssertTrue(isFirstNameValid, "The isFirstNameValid() Should Have returned TRUE for a valid first name but returned FALSE")
    }
    
    func testSignupFormModelValidator_WhenTooShortFirstNameProvided_ShouldReturnFalse() {
        
        // Arrange
        // Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "a")
        
        // Assert
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() Should Have returned False for a first name that is shorter than \(SignupConstants.firstNameMinLength) characters but it has returned TRUE")
    }
    
    func testSignupForModelValidator_WhenTooLongFirstNameProvided_ShouldReturnFalse() {
        
        // Arrange
        // Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "TedTedTedTedTedTed")
        
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() Should Have returned False for a first name that is longer than \(SignupConstants.firstNameMaxLength) characters but it has returned TRUE")
    }
    
}
