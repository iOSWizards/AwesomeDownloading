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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        AwesomeDownloading.downloadMedia(withUrl: URL(string: "https://archive.org/download/VirtualHaircut/virtualbarbershop.mp3"), completion: { (successful) in
            print("Downloaded Status: \(successful)")
        }) { (progress) in
            print("Downloaded: \(progress)")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

