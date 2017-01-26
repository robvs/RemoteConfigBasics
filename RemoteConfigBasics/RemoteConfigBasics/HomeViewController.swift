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
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // view configuration
		
		// waves  https://c2.staticflickr.com/4/3773/11459131034_eb5711bc79_h.jpg
		// rowing https://c1.staticflickr.com/3/2849/11459260503_e5f7e787f7_h.jpg
		// turtle https://c1.staticflickr.com/3/2833/11457337475_bd93420fea_h.jpg
		// bay    https://c2.staticflickr.com/4/3781/11459133104_04e2a807a4_h.jpg
		let urlString = RemoteConfigManager.sharedInstance.imageULRString
		if let url = URL(string: urlString), let data = try? Data(contentsOf: url) {
			configurableImage.image = UIImage(data: data)
		}
		else {
			configurableImage.image = UIImage(named: "waves-and-rocks")
		}
    }
}


// MARK: - Actions

extension HomeViewController {
	
	@IBAction fileprivate func changeTextBlockButtonTapped(_ sender: UIButton) {
		label1TextBlock.text = RemoteConfigManager.sharedInstance.label1Text
	}
	
	@IBAction fileprivate func refreshConfigButtonTapped(_ sender: UIButton) {
		RemoteConfigManager.sharedInstance.fetchRemoteValues()
	}
	
}
