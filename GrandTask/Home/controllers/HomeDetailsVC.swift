//
//  HomeDetailsVC.swift
//  GrandTask
//
//  Created by host on 26/12/2022.
//

import UIKit

class HomeDetailsVC: UIViewController {

    @IBOutlet weak var photo:UIImageView!
    @IBOutlet weak var titleLabel:UILabel!
    @IBOutlet weak var authorLabel:UILabel!
    @IBOutlet weak var timeLabel:UILabel!
    @IBOutlet weak var descriptionLabel:UITextView!

    
    
    
    
    let viewModel = HomeDetailsViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    private func setupView(){
        configCell(model: viewModel.article!)
    }
    func configCell(model:Article){
        titleLabel.text = model.title ?? ""
        authorLabel.text = model.author ?? ""
        photo.setImage(url: model.urlToImage)
        descriptionLabel.text = model.articleDescription ?? ""
        timeLabel.text = model.publishedAt?.relativeDate
    }
    
}
