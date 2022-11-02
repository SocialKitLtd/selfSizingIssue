//
//  ViewController.swift
//  selfSizingIssue
//
//  Created by Roi Mulia on 02/11/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let collectionView = AdaptiveTitleCollectionView()
        
        containerView.addSubview(collectionView)
        collectionView.bindMarginsToSuperview()
        
        // Do any additional setup after loading the view.
    }


}

public extension UIViewController {
    func addAsChildTo(parentVc: UIViewController, inside container: UIView, insets: UIEdgeInsets = .zero) {
        parentVc.addChild(self)
        self.view.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(self.view)
        
        view.bindMarginsToSuperview(insets: insets)
        didMove(toParent: parentVc)
    }
    
}

extension UIView {
    func bindMarginsToSuperview(insets: UIEdgeInsets = .zero) {
        guard let superview = self.superview else {
            print("Error! `superview` was nil – call `addSubview(view: UIView)` before calling `bindFrameToSuperviewBounds()` to fix this.")
            return
        }
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: insets.left).isActive = true
        self.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: insets.right).isActive = true
        self.topAnchor.constraint(equalTo: superview.topAnchor, constant: insets.top).isActive = true
        self.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: insets.bottom).isActive = true
    }
}
