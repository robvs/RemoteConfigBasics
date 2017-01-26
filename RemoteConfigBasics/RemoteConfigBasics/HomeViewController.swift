//
//  HomeViewController.swift
//  RemoteConfigBasics
//
//  Created by Rob Vander Sloot on 1/23/17.
//  Copyright © 2017 Random Visual. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

	@IBOutlet fileprivate weak var label1TextBlock: UILabel!
	@IBOutlet fileprivate weak var label2TextBlock: UILabel!
	@IBOutlet fileprivate weak var configurableImage: UIImageView!
	@IBOutlet fileprivate weak var changeTextBlockButton: UIButton!
	@IBOutlet fileprivate weak var RefreshConfigButton: UIButton!
    
    fileprivate var labelToChange: Int = 1 {
        didSet {
            // Update the change-text button title to indicate which
            // label will be changed.
            let buttonTitle = "Change Label \(labelToChange) Text"
            changeTextBlockButton.setTitle(buttonTitle, for: UIControlState())
        }
    }
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // view configuration
		
        labelToChange = RemoteConfigManager.sharedInstance.labelToChange
        updateImageFromActiveConfiguration()
    }
}


// MARK: - User actions

extension HomeViewController {
	
	@IBAction fileprivate func changeTextBlockButtonTapped(_ sender: UIButton) {
        
        // Choose which label is changed according to what is designated 
        // in the current configuration
        switch labelToChange {
        case 1:
            label1TextBlock.text = RemoteConfigManager.sharedInstance.labelText
        case 2:
            label2TextBlock.text = RemoteConfigManager.sharedInstance.labelText
        default:
            label1TextBlock.text = "Error: Invalid label number"
        }
	}
	
	@IBAction fileprivate func refreshConfigButtonTapped(_ sender: UIButton) {
        
		RemoteConfigManager.sharedInstance.fetchRemoteValues { [weak self] in
            self?.labelToChange = RemoteConfigManager.sharedInstance.labelToChange
            self?.updateImageFromActiveConfiguration()
        }
	}
}


// MARK: - Helpers

fileprivate extension HomeViewController {
    
    /// Get the active image url from the configuration manager and 
    /// update the image view.
    func updateImageFromActiveConfiguration() {
        
        // waves  https://c2.staticflickr.com/4/3773/11459131034_eb5711bc79_h.jpg
        // rowing https://c1.staticflickr.com/3/2849/11459260503_e5f7e787f7_h.jpg
        // turtle https://c1.staticflickr.com/3/2833/11457337475_bd93420fea_h.jpg
        // bay    https://c2.staticflickr.com/4/3781/11459133104_04e2a807a4_h.jpg
        let urlString = RemoteConfigManager.sharedInstance.imageULRString
        
        if let imageURL = URL(string: urlString),
           let imageData = try? Data(contentsOf: imageURL) {
            
            configurableImage.image = UIImage(data: imageData)
        }
        else {
            configurableImage.image = UIImage(named: "waves-and-rocks")
        }
    }
}
