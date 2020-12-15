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
    private let containerContentView = UIView()
    private let scrollView = UIScrollView()
    private let uiWidth = UIScreen.main.bounds.width - 20
    
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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // Config ImageView
        modelImageView.frame = CGRect(x: 10,
                                      y: 10,
                                      width:uiWidth,
                                      height: UIScreen.main.bounds.height / 3)
        
        // Config Label
        modelSpecLabel.frame = CGRect(x: 10,
                                      y: modelImageView.frame.maxY + 10,
                                      width: uiWidth,
                                      height: modelSpecLabel.frame.height)
        
        containerContentView.frame = CGRect(origin: CGPoint(),
                                            size: CGSize(width: UIScreen.main.bounds.width,
                                                         height: modelSpecLabel.frame.maxY))
        // Config scrollView
        scrollView.frame = view.frame
        scrollView.contentSize = containerContentView.frame.size
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
            modelSpecLabel.frame = CGRect(x: 10,
                                          y: modelImageView.frame.maxY + 10,
                                          width: uiWidth,
                                          height: UIFont.systemFont(ofSize: 17).calculateHeight(text: model.spec,
                                                                                                width: uiWidth))
        }
    }
}

// MARK: - private methods
extension DetailViewController {
    
    private func configurateView() {
        scrollView.alwaysBounceVertical = true

        view.backgroundColor = .white
        modelImageView.contentMode = .scaleAspectFit
        modelSpecLabel.numberOfLines = 0
        containerContentView.addSubview(modelImageView)
        containerContentView.addSubview(modelSpecLabel)
        view.addSubview(scrollView)
        scrollView.addSubview(containerContentView)
    }
}

extension UIFont {
    func calculateHeight(text: String, width: CGFloat) -> CGFloat {
        let constraintRect = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        let boundingBox = text.boundingRect(with: constraintRect,
                                        options: NSStringDrawingOptions.usesLineFragmentOrigin,
                                        attributes: [.font: self],
                                        context: nil)
        return boundingBox.height
    }
}
