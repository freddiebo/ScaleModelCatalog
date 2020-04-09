//  Представление для просмотра изображения с DetailViewController
//
//  Created by  Vladislav Bondarev on 23.03.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UIScrollViewDelegate {

    var imageSelected: UIImage?
    
    @IBOutlet weak var viewScroll: UIScrollView!
    @IBOutlet weak var viewImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewImage.image = imageSelected

        viewScroll.minimumZoomScale = 1
        viewScroll.maximumZoomScale = 3
        viewScroll.delegate = self
    }
    
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return viewImage
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }

}
