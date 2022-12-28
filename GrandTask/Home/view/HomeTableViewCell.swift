//
//  HomeTableViewCell.swift
//  GrandTask
//
//  Created by host on 26/12/2022.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    
    
    
    static var cellIdentifier = "HomeTableViewCell"
    @IBOutlet weak var photo:UIImageView!
    @IBOutlet weak var titleLabel:UILabel!
    @IBOutlet weak var authorLabel:UILabel!
    @IBOutlet weak var timeLabel:UILabel!
    @IBOutlet weak var descriptionLabel:UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

      
    }
    
    
    func configCell(model:Article){
        titleLabel.text = model.title ?? ""
        authorLabel.text = model.author ?? ""
        photo.setImage(url: model.urlToImage)
        descriptionLabel.text = model.articleDescription ?? ""
        timeLabel.text = model.publishedAt?.relativeDate
    }
    
}
