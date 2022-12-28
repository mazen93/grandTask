//
//  headlineCell.swift
//  GrandTask
//
//  Created by host on 26/12/2022.
//

import UIKit

class headlineCell: UICollectionViewCell {

    
    static var cellIdentifier = "headlineCell"
    @IBOutlet weak var photo:UIImageView!
    @IBOutlet weak var titleLabel:UILabel!
    @IBOutlet weak var authorLabel:UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
    
    func configCell(model:Article){
        titleLabel.text = model.title ?? ""
        authorLabel.text = model.author ?? ""
        photo.setImage(url: model.urlToImage)
    }

}
