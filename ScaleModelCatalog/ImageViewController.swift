//
//  ImageViewController.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 23.03.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UIScrollViewDelegate {

    var selectImage: String = ""
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 2.0
        scrollView.delegate = self
        
        //self.imageView.image = UIImage(named: selectImage)
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView.self
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
