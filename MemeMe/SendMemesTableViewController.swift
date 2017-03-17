//
//  SendMemesTableViewController.swift
//  MemeMe
//
//  Created by Li, Haibo on 2/24/17.
//  Copyright © 2017 Amazon. All rights reserved.
//

import UIKit

private let reuseIdentifier = "sendMemeTableViewCell"
let memeDetailViewControllerIdentifier = "memeDetailViewController"

class SendMemesTableViewController: UITableViewController {
    var memes: [Meme]!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        memes = (UIApplication.shared.delegate as! AppDelegate).memes
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)

        // Configure the cell...
        let meme: Meme = self.memes[indexPath.row]
        cell.imageView?.image = meme.memedImage
        cell.textLabel?.text = meme.topText + "..." + meme.bottomText;
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        openDetailMemeVC(withMeme: self.memes[indexPath.row], self)
    }
}

// MARK: - Public method

func openDetailMemeVC(withMeme meme: Meme, _ sender: Any) {
    let memeDetailViewController = (sender as AnyObject).storyboard??.instantiateViewController(withIdentifier: memeDetailViewControllerIdentifier) as! MemeDetailViewController
    memeDetailViewController.meme = meme
    (sender as AnyObject).navigationController??.pushViewController(memeDetailViewController, animated: true)
}
