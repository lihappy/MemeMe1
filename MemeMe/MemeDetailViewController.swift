//
//  MemeDetailViewController.swift
//  MemeMe
//
//  Created by Li, Haibo on 2/25/17.
//  Copyright © 2017 Amazon. All rights reserved.
//

import UIKit

class MemeDetailViewController: UIViewController {
    
    var meme: Meme!

    @IBOutlet weak var memeImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.memeImageView.image = meme.memedImage
    }

}
