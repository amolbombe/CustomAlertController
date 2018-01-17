//
//  MyCustomAlertViewController.swift
//  CustomAlertController
//
//  Created by Amol Bombe on 17/01/18.
//  Copyright © 2018 Amol. All rights reserved.
//

import UIKit

class MyCustomAlertViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var backgroundView: UIView!
    
    var yesAlertAction: MyAlertAction?
    var noAlertAction: MyAlertAction?
    var alertTitle: String?
    var alertMessage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.modalPresentationStyle = .overCurrentContext
        setupView()
    }

    func setupView() {
        yesButton.setTitle(yesAlertAction?.title, for: .normal)
        noButton.setTitle(noAlertAction?.title, for: .normal)
        titleLabel.text = alertTitle
        messageLabel.text = alertMessage
        setShadowToBackground()
    }
    
    func setShadowToBackground() {
        backgroundView.layer.masksToBounds = false
        backgroundView.layer.shadowColor = UIColor.red.cgColor
        backgroundView.layer.shadowOpacity = 1
        backgroundView.layer.shadowOffset = CGSize(width: -1, height: 1)
        backgroundView.layer.shadowRadius = 3
        
        backgroundView.layer.shadowPath = UIBezierPath(rect: backgroundView.bounds).cgPath
        backgroundView.layer.shouldRasterize = true
        backgroundView.layer.rasterizationScale = true ? UIScreen.main.scale : 1
    }
    
    @IBAction func yesButtonAction(_ sender: UIButton) {
        yesAlertAction?.action(self.yesAlertAction)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func noButtonAction(_ sender: UIButton) {
        noAlertAction?.action(self.noAlertAction)
        self.dismiss(animated: true, completion: nil)
    }
}

class MyAlertAction {
    var title: String?
    var action: (MyAlertAction?)-> (Void)
    
    init(title: String?, action: @escaping (MyAlertAction?)->()) {
        self.title = title
        self.action = action
    }
}
