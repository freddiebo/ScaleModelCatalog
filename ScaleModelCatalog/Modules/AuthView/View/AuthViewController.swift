//
//  AuthViewController.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 28.08.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class AuthViewController: UIViewController {

    var presenter: AuthViewOutputProtocol?
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var pswdTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }

    @IBAction func SignInTapped(_ sender: Any) {
        let email = loginTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = pswdTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if error != nil {
                // Couldn't sign in
                
            }
            else {
                let db = Firestore.firestore()
                
                var firstName = ""
                var lastName = ""
                
                db.collection("users").whereField("uid", isEqualTo: result!.user.uid).getDocuments() { (querySnapshot, err) in
                    if let err = err {
                        print("Error getting documents: \(err)")
                    } else {
                        for document in querySnapshot!.documents {
                            let data = document.data()
                            //print("\(document.documentID) => \(document.data())")
                            firstName = data["firstname"]! as! String
                            print(firstName)
                            lastName = data["lastname"]! as! String
                        }
                        let alertControll = UIAlertController(title: "Hello, \(lastName) \(firstName)", message: "", preferredStyle: .alert)
                        alertControll.addAction(UIAlertAction(title: "OK", style: .default))
                        self.present(alertControll, animated: true)
                    }
                }
            }
        }
    }
    @IBAction func signUpTapped(_ sender: Any) {
        let signUpView = SignUpAssembly.createTableViewModule()
        //present(signUpView, animated: true)
        navigationController?.pushViewController(signUpView, animated: true)
    }
    
    func showErrorMessage(message: String) {
        let alertControll = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alertControll.addAction(UIAlertAction(title: "OK", style: .default))
        present(alertControll, animated: true)
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
