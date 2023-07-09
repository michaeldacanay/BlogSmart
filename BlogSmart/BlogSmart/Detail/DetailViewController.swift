//
//  DetailViewController.swift
//  BlogSmart
//
//  Created by Raunaq Malhotra on 5/1/23.
//

import UIKit
import Alamofire
import AlamofireImage

class DetailViewController: UIViewController {
    
    @IBOutlet weak var blogImage: UIImageView!
    @IBOutlet weak var blogTitle: UILabel!
    @IBOutlet weak var blogDate: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var content: UILabel!
    
    @IBOutlet weak var blogMenu: UIBarButtonItem!
    
    private var imageDataRequest: DataRequest?
    
    var post: Post!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Make sure the user cannot block themselves!
        if let currentUser = User.current,
           let postUser = self.post.user {
            
            if currentUser.username == postUser.username {
                blogMenu.isEnabled = false
                blogMenu.width = 0
            } else {
                blogMenu.menu = addMenuItems()
            }
            
        }
        
        // Do any additional setup after loading the view.
        blogTitle.text = post.title
        // Image
        if let imageFile = post.imageFile,
           let imageUrl = imageFile.url {
            
            // Use AlamofireImage helper to fetch remote image from URL
            imageDataRequest = AF.request(imageUrl).responseImage { [weak self] response in
                switch response.result {
                case .success(let image):
                    // Set image view image with fetched image
                    self?.blogImage.image = image
                    
                case .failure(let error):
                    print("❌ Error fetching image: \(error.localizedDescription)")
                    break
                }
            }
        }
        
        if let date = post.createdAt {
            blogDate.text = DateFormatter.postFormatter.string(from: date)
        }
        
        if let user = post.user,
           let username = user.username {
            author.text = "by "
            author.text! += username
        }
        content.text = post.content
    }
    
    func addMenuItems() -> UIMenu {
        
        let menuItems = UIMenu(title: "", options: .displayInline, children: [
            
            UIAction(title: "Block User", image: UIImage(systemName: "person.crop.circle.fill.badge.xmark"), attributes: .destructive, handler: { (_) in
                self.showConfirmBlockUser()
            })
            
            ,
            
            UIAction(title: "Report this blog", image: UIImage(systemName: "exclamationmark.octagon.fill"), attributes: .destructive, handler: { (_) in
                print("Flag user")
            })
        ])
        
        return menuItems
    }
    
    
    private func showConfirmBlockUser() {
        
        // Confirm if the user wants to block the other user
        let alertController = UIAlertController(title: "Block User?", message: "Once you block this user, we will remove their posts from your blog feed. This action cannot be undone. Are you sure?", preferredStyle: .alert)
        
        let blockAction = UIAlertAction(title: "Block", style: .destructive) { _ in
            
            if var currentUser = User.current,
               let postUser = self.post.user,
               let blockedUsers = currentUser.blockedUsers {
                
                print(blockedUsers)
                print("Current user is \(currentUser)")
                currentUser.blockedUsers?.append((postUser.objectId)!)
                print("Blocked users are \(blockedUsers)")
                print("post user is ", postUser)
                try? currentUser.save()
            }
            NotificationCenter.default.post(name: Notification.Name("Go back to the initial screen"), object: nil)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(blockAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
}
