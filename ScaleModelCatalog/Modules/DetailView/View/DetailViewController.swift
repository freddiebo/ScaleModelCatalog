//  Представление для просмотра детальной информации по выбранной модели
//
//  Created by  Vladislav Bondarev on 19.03.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIScrollViewDelegate {
    
    var presenter: DetailViewOutputProtocol?
    private let modelImageView = UIImageView()
    private let modelSpecLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("DetailViewController viewDidLoad")

        configurateView()
        
        presenter?.viewDidLoad()
        addTap(for: modelImageView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("DetailViewController viewWillAppear")
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("DetailViewController viewWillDisappear")

        navigationController?.hidesBarsOnTap = false
    }
    
    private func addTap(for imageView: UIImageView) {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                          action: #selector(imageTapped(tapGestureRecognizer:)))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc
    private func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        presenter?.imageViewShow(image: tappedImage.image!,
                                 from: self)
    }
}

// MARK: - DetailViewInputProtocol
extension DetailViewController: DetailViewInputProtocol {
    func loadInterface() {
        print("DetailViewController loadInterface")

        title = presenter?.model?.name
        navigationItem.largeTitleDisplayMode = .never
        let service = ServerService.shared
        if let model = presenter?.model {
            service.getImageModel(with: model.id,
                                  from: model.image) { image in
                self.modelImageView.image = image
            }
        modelSpecLabel.text = model.spec
        }

        
    }
}

// MARK: - private methods
extension DetailViewController {
    
    private func configurateView() {
        view.backgroundColor = .white

        // Config ImageView
        modelImageView.frame = CGRect(x: 10,
                                      y: 10,
                                      width: UIScreen.main.bounds.width - 20,
                                      height: UIScreen.main.bounds.height / 3)
        modelImageView.contentMode = .scaleAspectFit
        
        // Config Label
        modelSpecLabel.frame = CGRect(x: 10,
                                      y: 10 + UIScreen.main.bounds.height / 3,
                                      width: 0,//UIScreen.main.bounds.width - 20,
                                      height: 0)//UIScreen.main.bounds.height)
        modelSpecLabel.numberOfLines = 0
        modelSpecLabel.sizeToFit()
        
        // Config conteiner for ScrollView
        let containerContentView = UIView()
        containerContentView.addSubview(modelImageView)
        containerContentView.addSubview(modelSpecLabel)
        containerContentView.frame = CGRect(origin: CGPoint(),
                                            size: CGSize(width: modelImageView.frame.width,
                                                         height: modelImageView.frame.height +
                                                            modelSpecLabel.frame.height))
        // Config scrollView
        let scrollView = UIScrollView(frame: UIScreen.main.bounds)
        view.addSubview(scrollView)
        scrollView.addSubview(containerContentView)
        scrollView.contentSize = containerContentView.frame.size
    }
}
