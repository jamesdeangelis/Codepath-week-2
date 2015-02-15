//
//  tutoViewController.swift
//  Carousel
//
//  Created by James De Angelis on 14/02/2015.
//  Copyright (c) 2015 James De Angelis. All rights reserved.
//

import UIKit

class tutoViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var tutoScrollView: UIScrollView!
    @IBOutlet weak var pipsView: UIPageControl!
    @IBOutlet weak var enterBlock: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tutoScrollView.delegate = self
        tutoScrollView.contentSize = CGSize(width: 1280, height: 568)
//        enterBlock.hidden = true
        self.enterBlock.alpha = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidEndDecelerating(tutoScrollView: UIScrollView!) {
        // Get the current page based on the scroll offset
        var page : Int = Int(round(tutoScrollView.contentOffset.x / 320))
        // Set the current page, so the dots will update
        pipsView.currentPage = page
        
        if (page == 3) {
            UIView.animateWithDuration(0.4, animations: {
                // This causes first view to fade in and second view to fade out
                self.enterBlock.alpha = 1
                self.pipsView.alpha = 0
            })
        }
        
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
