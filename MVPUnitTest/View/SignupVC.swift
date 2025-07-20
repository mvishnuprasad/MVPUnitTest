//
//  SignupVC.swift
//  MVPUnitTest
//
//  Created by vishnuprasadm on 19/07/25.
//

import UIKit

class SignupVC: UIViewController {
    
    @IBOutlet weak var termsButton: UIButton!
    var signUpPresenter: PresenterProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        setID()
        if signUpPresenter == nil {
            let modelValidator = SignUpFormValidator()
            let webService = SignUpWebService(urlString: SignUpConstants.signUpUrlString)
            signUpPresenter = SignUpPresenter(formModelValidator: modelValidator, websService: webService, delegate: self)
        }
    }
    @IBAction func termsButtonAction(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "TermsVC") as! TermsVC
        vc.view.accessibilityIdentifier = "TermsVc"
        self.navigationController?.pushViewController(vc, animated: true)
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
    func setID() {
        firstNameTextField.accessibilityIdentifier = "firstName"
        passWordTextField.accessibilityIdentifier = "password"
        signUpButton.accessibilityIdentifier = "signupButton"
        termsButton.accessibilityIdentifier = "termsButton"

    }
    func successFulSignUP() {
        let alert = UIAlertController(title: "Success", message: "Validation Success", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        DispatchQueue.main.async {
            alert.view.accessibilityIdentifier = "successDialog"
            self.present(alert, animated: true)
        }
    }
    
    func errorHandler(error: SignUpError) {
        let alert = UIAlertController(title: "Error", message: "Validation Failed", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        DispatchQueue.main.async {
            alert.view.accessibilityIdentifier = "errorDialog"
            self.present(alert, animated: true)
        }
    }
}
