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
    
    
    @IBAction func onDeleteClicked(_ sender: Any) {
        showConfirmDelete()
    }
    
    private func showConfirmDelete() {
        let alertController = UIAlertController(title: "Delete your account?", message: "This action will delete your account permanently and all the posts that you have created. You will not be able to restore your account or your posts. Are you sure?", preferredStyle: .alert)
        
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { _ in
            
            if var currentUser = User.current,
               let currentUserId = currentUser.objectId{
                
                let query = Post.query()
                    .where("user" == currentUserId)
                
                print("this is the user object id", currentUserId)
                                
                query.find { [weak self] result in
                    switch result {
                    case .success(let posts):
                        print("inside query find, length of posts is ", posts.count)
                        // Posts associated with the user found
                        self?.deletePosts(posts) // Proceed with deleting the posts
                        print("posts deleted. bye!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
                    case .failure(let error):
                        // Handle the error retrieving posts
                        print("Error retrieving posts: \(error)")
                    }
                }

                currentUser.delete { result in
                    switch result {
                    case .success:
                        // Account deletion successful
                        print("Account deleted successfully")
                        
                    case .failure(let error):
                        // Handle the error that occurred during account deletion
                        print("Error deleting account: \(error)")
                    }
                }
            }
            
            NotificationCenter.default.post(name: Notification.Name("logout"), object: nil)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(deleteAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
    
    func deletePosts(_ posts: [Post]) {
        print("length of post is", posts.count)
        for post in posts {
            post.delete {
                result in switch result {
                case .success:
                    // Post deletion successful
                    print("Post deleted successfully")
                case .failure(let error):
                    // Handle the error that occurred during post deletion
                    print("Error deleting post: \(error)")
                }
            }
        }
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    private func showInvalidEmailAlert() {
        let alertController = UIAlertController(title: "Oops...", message: "The email provided is invalid.", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)
        present(alertController, animated: true)
    }

    

}
