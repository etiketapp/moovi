//
//  CastDetailViewController.swift
//  moovi
//
//  Created by tunay alver on 14.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit
import Lottie

class CastDetailViewController: BaseVC {

    // MARK: - Outlets
    @IBOutlet private weak var animationView: AnimationView!
    @IBOutlet private weak var castImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var biagrophyLabel: UILabel!
    @IBOutlet private weak var knownLabel: UILabel!
    @IBOutlet private weak var birthdayLabel: UILabel!
    @IBOutlet private weak var popularityLabel: UILabel!
    
    // MARK: - Properties
    var presenter: CastDetailViewToPresenterProtocol!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addGestures()
        self.showLoadingDialog()
        presenter.getCastDetail()
    }
    
    //MARK: - Functions
    func addGestures() {
        castImageView.isUserInteractionEnabled = true
        castImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(castImageViewTapped)))
    }
    
    @objc func castImageViewTapped() {
        presenter.didTappedCastImageView()
    }
    
    //MARK: - Functions
    func fill(cast: CastDetail?) {
        if let url = cast?.profile_path {
            let imageUrl = RequestManager.imageInitialPath + url
            castImageView.setImageUrl(imageUrl: imageUrl)
            animationView.isHidden = true
        }else {
            animationView.isHidden = false
            animate(animationView: animationView, name: "notFound")
        }
        
        nameLabel.text = cast?.name
        birthdayLabel.text = cast?.biography
        knownLabel.text = cast?.known_for_department
        birthdayLabel.text = cast?.birthday
        popularityLabel.text = "\(cast?.popularity ?? 0)"
    }
    
}

// MARK: - CastDetailPresenterOutputDelegate
extension CastDetailViewController: CastDetailPresenterToViewProtocol {
    func didGetError(error: ResponseError) {
        self.hideLoadingDialog()
        self.performAlert(title: "Hata", message: error.status_message, buttonTitle: "OK", style: .alert)
    }
    
    func didGetCastDetail() {
        self.hideLoadingDialog()
        self.fill(cast: presenter.cast)
    }
}
