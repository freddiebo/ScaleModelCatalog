//  Представление для просмотра детальной информации по выбранной модели
//
//  Created by  Vladislav Bondarev on 19.03.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIScrollViewDelegate {
    
    var model: Model?
    var presenter: DetailViewOutputProtocol?
    @IBOutlet var modelImage: UIImageView!
    @IBOutlet var modelTextSpec: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        addTap(for: modelImage)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    func addTap(for imageView: UIImageView) {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        presenter?.imageViewShow(image: tappedImage.image!, from: self)
    }
}

// MARK: - DetailViewInputProtocol
extension DetailViewController: DetailViewInputProtocol {
    func loadInterface() {
        title = model?.name
        navigationItem.largeTitleDisplayMode = .never
        let service = ServerService.shared
        if let model = model {
            service.getImageModel(with: model.id, from: model.image, completion: { image in
                self.modelImage.image = image
            })
        modelTextSpec.text = model.spec
        }
    }
}
