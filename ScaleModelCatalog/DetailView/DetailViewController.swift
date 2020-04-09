//  Представление для просмотра детальной информации по выбранной модели
//
//  Created by  Vladislav Bondarev on 19.03.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet var modelImage: UIImageView!    
    @IBOutlet var modelTextSpec: UITextView!
    var modelSelectedName: String?
    //var selectedModelImage: String = ""
    var modelSelectedImage: UIImage?
    var modelSelectedSpec: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = modelSelectedName
        navigationItem.largeTitleDisplayMode = .never
        modelImage.image = modelSelectedImage//UIImage(named: selectedModelImage)
        modelTextSpec.text = modelSelectedSpec
        
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        modelImage.isUserInteractionEnabled = true
        modelImage.addGestureRecognizer(tapGestureRecognizer)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        //let tappedImage = tapGestureRecognizer.view as! UIImageView
        /*if let vc = storyboard?.instantiateViewController(identifier: "ImageView") as? ImageViewController {
            vc.selectImage = selectedModelImage
            navigationController?.pushViewController(vc, animated: true)
        }*/
        let vc = ImageViewController()
        vc.imageSelected = modelSelectedImage
        navigationController?.pushViewController(vc, animated: true)
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
