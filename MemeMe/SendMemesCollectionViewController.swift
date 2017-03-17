//
//  SendMemesCollectionViewController.swift
//  MemeMe
//
//  Created by Li, Haibo on 2/24/17.
//  Copyright © 2017 Amazon. All rights reserved.
//

import UIKit

private let reuseIdentifier = "SendMemesCollectionViewCell"

class SendMemesCollectionViewController: UICollectionViewController {
    var memes: [Meme]!

    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        memes = (UIApplication.shared.delegate as! AppDelegate).memes
        self.collectionView?.reloadData()
        
        let orientation = UIApplication.shared.statusBarOrientation
        let itemCountInRow: CGFloat = orientation.isPortrait ? 3.0 : 6.0;
        let space: CGFloat = 3.0
        let dimension = ((orientation.isPortrait ? view.frame.size.width : view.frame.size.height) - ((itemCountInRow - 1) * space)) / itemCountInRow
        
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSize(width: dimension, height: dimension)
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return memes.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SendMemeCollectionViewCell
        
        // Configure the cell
        let meme: Meme = self.memes[indexPath.row]
        cell.sendMemeImageView.image = meme.originalImage
        cell.topLabel.text = meme.topText
        cell.bottomLabel.text = meme.bottomText
    
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        openDetailMemeVC(withMeme: self.memes[indexPath.row], self)
    }

    override func viewDidLayoutSubviews() {
        NSLog("haha")
        let orientation = UIApplication.shared.statusBarOrientation
        let itemCountInRow: CGFloat = orientation.isPortrait ? 3.0 : 6.0;
//        let itemCountInRow: CGFloat = 3.0
        let space: CGFloat = 3.0
        
        NSLog("width:%lf, h:%lf", view.frame.size.width, view.frame.size.height)
        
//        let dimension = ((orientation.isPortrait ? view.frame.size.width : view.frame.size.height) - ((itemCountInRow - 1) * space)) / itemCountInRow
        let dimension = (view.frame.size.width - ((itemCountInRow - 1) * space)) / itemCountInRow
        
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSize(width: dimension, height: dimension)
    }
}

//extension SendMemesCollectionViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        NSLog("haha")
//        return CGSize(width: 123, height: 123)
//    }
//}
