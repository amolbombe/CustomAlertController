//
//  MainViewController.swift
//  CustomAlertController
//
//  Created by Amol Bombe on 17/01/18.
//  Copyright © 2018 Amol. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var selectedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func alertButtonTapped(_ sender: UIButton) {
        let alertController = MyCustomAlertViewController()
        alertController.alertTitle = "Title"
        alertController.alertMessage = "My Alert Message"
        alertController.yesAlertAction = MyAlertAction(title: "Yes", action: { [weak self] action in
            self?.selectedLabel.text = (action?.title ?? "") + " Selected"
        })
        alertController.noAlertAction = MyAlertAction(title: "No", action: { [weak self] action in
            self?.selectedLabel.text = (action?.title ?? "") + " Selected"
        })
        alertController.modalPresentationStyle = .overCurrentContext
        self.navigationController?.present(alertController, animated: true, completion: nil)
    }

}
