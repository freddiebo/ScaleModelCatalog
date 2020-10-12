//
//  SignUpViewController.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 02.09.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignUpViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var firstNameField: SignUpTextField!
    @IBOutlet weak var emailField: SignUpTextField!
    @IBOutlet weak var passwordField: SignUpTextField!
    @IBOutlet weak var lastNameField: SignUpTextField!
    @IBOutlet weak var errorLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let Tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DismissKeyboard))
        view.addGestureRecognizer(Tap)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
        // Do any additional setup after loading the view.
    }

    @IBAction func back(_ sender: Any) {
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        let email = emailField.text!
        let password = passwordField.text!
        let firstName = firstNameField.text!
        let lastName = lastNameField.text!
        
        
        firstNameField.resetField()
        lastNameField.resetField()
        emailField.resetField()
        passwordField.resetField()
        
        let result = checkField()
        
        //create User
        if result == "Success" {
            Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                if let error = error {
                    self.showErrorMessage(message: error.localizedDescription)
                }
                
                let db = Firestore.firestore()
                
                db.collection("users").addDocument(data: ["firstname":firstName, "lastname":lastName, "uid": result!.user.uid ]) { (error) in
                    
                    if let error = error {
                        self.showErrorMessage(message: error.localizedDescription)
                    }
                }
                
            }
        }
        else {
            errorLable.text = result
            errorLable.textColor = .red
            //self.showErrorMessage(message: result)
        }
    }
    
    func showErrorMessage(message: String) {
        let alertControll = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alertControll.addAction(UIAlertAction(title: "OK", style: .default))
        present(alertControll, animated: true)
    }
    
    func checkField() -> String {
        let empty = ""
        var result = "Success"
        switch empty {
        case firstNameField.text!:
            firstNameField.setWrongFiled()
            result = "Error! Please, enter First Name"
        case lastNameField.text!:
            lastNameField.setWrongFiled()
            result = "Error! Please, enter Last Name"
        case emailField.text!:
            emailField.setWrongFiled()
            result = "Error! Please, enter E-mail"
        case passwordField.text!:
            passwordField.setWrongFiled()
            result = "Error! Please, enter password"
        default:
            result = "Success"
        }
        return result
    }
    
    @objc func DismissKeyboard() {
        view.endEditing(true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
