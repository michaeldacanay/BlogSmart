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
    
    private var imageDataRequest: DataRequest?
    
    var post: Post!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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

}
