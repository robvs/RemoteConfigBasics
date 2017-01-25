//
//  HomeViewController.swift
//  RemoteConfigBasics
//
//  Created by Rob Vander Sloot on 1/23/17.
//  Copyright © 2017 Random Visual. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

	@IBOutlet private weak var label1TextBlock: UILabel!
	@IBOutlet private weak var label2TextBlock: UILabel!
	@IBOutlet private weak var configurableImage: UIImageView!
	@IBOutlet private weak var changeTextBlockButton: UIButton!
	@IBOutlet private weak var RefreshConfigButton: UIButton!
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // view configuration
		
		// waves  https://c2.staticflickr.com/4/3773/11459131034_eb5711bc79_h.jpg
		// rowing https://c1.staticflickr.com/3/2849/11459260503_e5f7e787f7_h.jpg
		// turtle https://c1.staticflickr.com/3/2833/11457337475_bd93420fea_h.jpg
		// bay    https://c2.staticflickr.com/4/3781/11459133104_04e2a807a4_h.jpg
		if let url  = URL(string: "https://farm3.staticflickr.com/2833/11457337475_3d6fbc795f_z_d.jpg"),
		   let data = try? Data(contentsOf: url) {
			configurableImage.image = UIImage(data: data)
		}
		else {
			configurableImage.image = UIImage(named: "waves-and-rocks")
		}
    }
}


// MARK: - Actions

extension HomeViewController {
	
	@IBAction func changeTextBlockButtonTapped(_ sender: UIButton) {
	}
	
	@IBAction func refreshConfigButtonTapped(_ sender: UIButton) {
	}
	
}
