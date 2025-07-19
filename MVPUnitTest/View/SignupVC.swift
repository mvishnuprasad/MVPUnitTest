//
//  SignupVC.swift
//  MVPUnitTest
//
//  Created by qbuser on 19/07/25.
//

import UIKit

class SignupVC: UIViewController {
    
    var signUpPresenter: PresenterProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if signUpPresenter == nil {
            let modelValidator = SignUpFormValidator()
            let webService = SignUpWebService(urlString: SignUpConstants.signUpUrlString)
            signUpPresenter = SignUpPresenter(formModelValidator: modelValidator, websService: webService, delegate: self)
        }
    }
    
    @IBAction func signUp(_ sender: Any) {
        let signupFormModel = SignUpFormModel(firstName: firstNameTextField.text ?? "" , lastName: lastNameTextField.text ?? "", email: EmailTestField.text ?? "", password: passWordTextField.text ?? "", repeatPassword: repeatPasswordTextField.text ?? "")
        signUpPresenter?.processUserSignUp(formModel: signupFormModel)
    }
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    @IBOutlet weak var passWordTextField: UITextField!
    @IBOutlet weak var EmailTestField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    
    
}
extension SignupVC : SignUpViewDelegateProtocol {
    func successFulSignUP() {
        
    }
    
    func errorHandler(error: SignUpError) {
        
    }
}
