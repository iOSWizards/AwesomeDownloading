//
//  ViewController.swift
//  AwesomeDownloading
//
//  Created by emmanuelstroem on 06/10/2018.
//  Copyright (c) 2018 emmanuelstroem. All rights reserved.
//

import UIKit
import AwesomeDownloading

class ViewController: UIViewController {

    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var percentageLabel: UILabel!
    
    @IBOutlet weak var deleteMediaButton: UIButton!
    
    // Private Variables
    let mediaUrl = URL(string: "https://archive.org/download/VirtualHaircut/virtualbarbershop.mp3")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //hide download button if file is not available offline
        if AwesomeDownloading.mediaDownloadState(withUrl: mediaUrl) != .downloaded {
            deleteMediaButton.isHidden = true
        }
        
        
        AwesomeDownloading.downloadMedia(withUrl: mediaUrl, completion: { (successful) in
            print("Downloaded Status: \(successful)")
        }) { (progress) in
            self.progressBar.progress = progress
            self.percentageLabel.text = AwesomeDownloading.mediaDownloadState(withUrl: self.mediaUrl) == .downloaded ? "File Available Offline" : "\(roundf(progress * 100)) %"
            
            if progress == 1.0 {
                self.deleteMediaButton.isHidden = false
            }
            print("Downloaded: \(progress)")
        }
        
    }
    
    
    @IBAction func deleteMediaButtonPressed(_ sender: UIButton) {
        confirmMediaDeletion(withUrl: mediaUrl, withTitle: "Delete Barber Shop?", withMessage: "This will remove the barber shop from the corner street", withConfirmButtonTitle: "YES", withCancelButtonTitle: "Cancel"){ (successful) in
            print("Downloaded Media Deleted")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

