//
//  loginViewController.swift
//  ROBHEALTHCARE
//
//  Created by User on 5/12/25.
//

import UIKit

class loginViewController: UIViewController {
    @IBOutlet weak var hiwelcomebacklabel: UILabel!{
        didSet{
            hiwelcomebacklabel.font = UIFont.boldSystemFont(ofSize: 22)
        }
    }
    @IBOutlet weak var signinwithgooglebutton: UIButton!{
        didSet{
            signinwithgooglebutton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        }
    }
    
    @IBOutlet weak var signinwithfacebookbutton: UIButton!{
        didSet
        {
            signinwithfacebookbutton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        }
    }
    @IBOutlet weak var forgetpasswordbutton: UIButton!{
        didSet{
            forgetpasswordbutton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        }
    }
    
    @IBOutlet weak var emailTextField: UITextField!
    
    
    @IBOutlet weak var Signinbutton: UIButton!
    {
        didSet
        {
            Signinbutton.layer.cornerRadius = 25
            Signinbutton.clipsToBounds = true
        }
    }
    @IBOutlet weak var passwordtextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func SigninPressedbutton(_ sender: Any) {
        guard let email = emailTextField.text, !email.isEmpty,
                  let password = passwordtextfield.text, !password.isEmpty else {
                showAlert(title: "Error", message: "Please enter email and password")
                return
            }

            Signinbutton.isEnabled = false

            NetworkManager.shared.login(usr: email, pwd: password) { [weak self] result in
                DispatchQueue.main.async {
                    self?.Signinbutton.isEnabled = true

                    switch result {
                    case .success(_):
                        // Save user data if needed
                        UserDefaults.standard.set(true, forKey: "isLoggedIn")
                        
                        // Navigate to next screen
                        let doctorVC = DoctorDetialsViewController(nibName: "DoctorDetialsViewController", bundle: nil)
                        self?.navigationController?.pushViewController(doctorVC, animated: true)
                        
                    case .failure(let error):
                        self?.showAlert(title: "Error", message: "Login failed: \(error.localizedDescription)")
                    }
                }
            }
        }
        
        @IBAction func signinwithgooglebuttonpressed(_ sender: Any) {
            
            let googlevc = googleloginViewController(nibName: "googleloginViewController", bundle: nil)
            navigationController?.pushViewController(googlevc, animated: true)
        }
        func isValidEmail(_ email: String) -> Bool {
            let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
        }
        
        
        
        func parseLoginError(_ error: Error) -> String {
            if let networkError = error as? NetworkError {
                switch networkError {
                case .noData:
                    return "Server didn't respond. Please try again."
                case .invalidURL:
                    return "Internal error. Please contact support."
                }
            }
            return error.localizedDescription
        }
        func showAlert(title: String, message: String) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
        }
        
    }
    
    


