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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
