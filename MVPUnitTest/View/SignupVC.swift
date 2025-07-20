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
        
        if signUpPresenter == nil {
            let modelValidator = SignUpFormValidator()
            let webService = SignUpWebService(urlString: SignUpConstants.signUpUrlString)
            signUpPresenter = SignUpPresenter(formModelValidator: modelValidator, websService: webService, delegate: self)
        }
    }
    @IBAction func termsButtonAction(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "TermsVC") as! TermsVC
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
    func successFulSignUP() {
        
    }
    
    func errorHandler(error: SignUpError) {
        
    }
}
