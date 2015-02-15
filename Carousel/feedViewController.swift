//
//  feedViewController.swift
//  Carousel
//
//  Created by James De Angelis on 14/02/2015.
//  Copyright (c) 2015 James De Angelis. All rights reserved.
//

import UIKit

class feedViewController: UIViewController {
    @IBOutlet weak var feedScrollVirw: UIScrollView!
    @IBOutlet weak var photoFeed: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        feedScrollVirw.contentSize = CGSize(width: 320, height: 1564)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
