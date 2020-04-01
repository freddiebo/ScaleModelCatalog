//  Представление для просмотра детальной информации по выбранной модели
//
//  Created by  Vladislav Bondarev on 19.03.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet var imageModel: UIImageView!    
    @IBOutlet var specModelText: UITextView!
    var selectedModel: String?
    //var selectedModelImage: String = ""
    var selectedModelImage: UIImage?
    var selectedModelSpec: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = selectedModel
        navigationItem.largeTitleDisplayMode = .never
        imageModel.image = selectedModelImage//UIImage(named: selectedModelImage)
        specModelText.text = selectedModelSpec
        
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imageModel.isUserInteractionEnabled = true
        imageModel.addGestureRecognizer(tapGestureRecognizer)
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
        vc.selectImage = selectedModelImage
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
