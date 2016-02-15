//
//  CroppedImageViewController.swift
//  ImageCroppingDemo
//
//  Created by Pankaj Verma on 15/02/16.
//  Copyright © 2016 Pankaj Verma. All rights reserved.
//

import UIKit

class CroppedImageViewController: UIViewController {
    var myImage :UIImage?
    @IBOutlet weak var croppedImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        croppedImage.image = myImage;
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
