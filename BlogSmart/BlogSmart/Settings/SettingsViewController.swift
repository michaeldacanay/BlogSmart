//
//  SettingsViewController.swift
//  BlogSmart
//
//  Created by Michael Dacanay on 6/12/23.
//

import UIKit
import ParseSwift

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let user = User.current
        username.placeholder = user?.username
        email.placeholder = user?.email
        password.placeholder = user?.password
    }
    
    @IBAction func onSave(_ sender: Any) {
        // Retrieve the object from the database
        if var currentUser = User.current {
            if !email.text!.isEmpty {
                if !isValidEmail(email.text!) {
                    showInvalidEmailAlert()
                    return
                }
                currentUser.email = email.text
            }
            
            if !username.text!.isEmpty {
                // Update the field
                currentUser.username = username.text
            }
            
            if !password.text!.isEmpty {
                currentUser.password = password.text
            }
            
            // Save the changes
            currentUser.save { result in
                switch result {
                case .success(let updatedUser):
                    print("Field updated successfully: \(updatedUser)")
                case .failure(let error):
                    print("Error updating field: \(error)")
                }
            }
        } else {
            print("No current user")
        }
        
        if !email.text!.isEmpty || !username.text!.isEmpty || !password.text!.isEmpty {
            // return to ReadViewController
            NotificationCenter.default.post(name: Notification.Name("logout"), object: nil)
        }
        
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    private func showInvalidEmailAlert() {
        let alertController = UIAlertController(title: "Opps...", message: "The email provided is invalid.", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)
        present(alertController, animated: true)
    }

    

}
