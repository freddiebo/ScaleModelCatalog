//  Представление для просмотра изображения с DetailViewController
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

        imageView.image = UIImage(named: selectImage)

        scrollView.minimumZoomScale = 1
        scrollView.maximumZoomScale = 3
        scrollView.delegate = self
    }
    
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
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
