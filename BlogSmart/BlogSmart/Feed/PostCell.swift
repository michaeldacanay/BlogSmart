//
//  PostCell.swift
//  BlogSmart
//
//  Created by Raunaq Malhotra on 4/26/23.
//

import UIKit
import Alamofire
import AlamofireImage

class PostCell: UITableViewCell {
    
    @IBOutlet weak var blogImage: UIImageView!
    @IBOutlet weak var blogDate: UILabel!
    @IBOutlet weak var blogTitle: UILabel!
    @IBOutlet weak var blogSummary: UILabel!
    
    private var imageDataRequest: DataRequest?
    
    func configure(with post: Post) {
        
        if let imageFile = post.imageFile,
           let imageUrl = imageFile.url {
            // Use AlamofireImage helper to fetch remote image from URL
            imageDataRequest = AF.request(imageUrl).responseImage() { [weak self] response in
                switch response.result {
                case .success(let image):
                    print("✅ Successfully fetched image!")
                    // Set image view image with fetched image
                    self?.blogImage.image = image
                case .failure(let error):
                    print("❌ Error fetching image: \(error.localizedDescription)")
                    break
                }
            }
        }
        
        blogTitle.text = post.title ?? "New Blog"
        // TODO: Use OpenAI API call to generate blog summary
        blogSummary.text = post.summary
        
        if let date = post.createdAt {
            blogDate.text = DateFormatter.postFormatter.string(from: date)
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        // Reset image view image.
        blogImage.image = nil
        
        // Cancel image request.
        imageDataRequest?.cancel()
    }
}
