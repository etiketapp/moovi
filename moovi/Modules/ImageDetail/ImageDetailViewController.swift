//
//  ImageDetailViewController.swift
//  moovi
//
//  Created by tunay alver on 14.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

class ImageDetailViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var closeButton: UIButton!
    
    // MARK: - Properties
    var presenter: ImageDetailViewToPresenterProtocol!
    var initialTouchPoint: CGPoint = CGPoint(x: 0, y: 0)
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addGestures()
        setImage()
    }
    
    //MARK: - Funcitons
    func setImage() {
        let imageUrl = RequestManager.imageInitialPath + presenter.imageUrl
        imageView.setImageUrl(imageUrl: imageUrl)
    }
    
    //MARK: - Gesture
    func addGestures() {
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureRecognizerHandler(_:)))
        self.view.addGestureRecognizer(gesture)
    }
    
    //MARK: - Dismiss on Swipe Function
    @objc func panGestureRecognizerHandler(_ sender: UIPanGestureRecognizer) {
        let touchPoint = sender.location(in: self.view?.window)
        if sender.state == UIGestureRecognizer.State.began {
            closeButton.isHidden = true
            initialTouchPoint = touchPoint
        } else if sender.state == UIGestureRecognizer.State.changed {
            if touchPoint.y - initialTouchPoint.y > 0 {
                let alpha = 1 - ((touchPoint.y - initialTouchPoint.y)) / (self.view.frame.height / 2)
                self.view.backgroundColor = UIColor.black.withAlphaComponent(alpha)
                self.imageView.frame = CGRect(x: 0, y: touchPoint.y - initialTouchPoint.y, width: self.imageView.frame.size.width, height: self.imageView.frame.size.height)
            }
        } else if sender.state == UIGestureRecognizer.State.ended || sender.state == UIGestureRecognizer.State.cancelled {
            if touchPoint.y > self.view.frame.height / 2 {
                self.dismiss(animated: true, completion: nil)
            } else {
                UIView.animate(withDuration: 0.3, animations: {
                    self.imageView.frame = CGRect(x: 0, y: 0, width: self.imageView.frame.size.width, height: self.imageView.frame.size.height)
                        self.view.backgroundColor = UIColor.black
                        self.closeButton.isHidden = false
                })
            }
        }
    }
    
    //MARK: - Actions
    @IBAction func closeButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    
}

// MARK: - ImageDetailPresenterOutputDelegate
extension ImageDetailViewController: ImageDetailPresenterToViewProtocol {

}
