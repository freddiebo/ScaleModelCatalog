//  Представление для просмотра детальной информации по выбранной модели
//
//  Created by  Vladislav Bondarev on 19.03.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIScrollViewDelegate, DetailViewProtocol {
    
    var model: Model?
    var presenter: DetailPresenterProtocol? 
    @IBOutlet var modelImage: UIImageView!
    @IBOutlet var modelTextSpec: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        presenter?.addTap(for: modelImage)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }

    func loadInterface() {
        title = model?.name
        navigationItem.largeTitleDisplayMode = .never
        modelImage.image = model?.loadImage()
        modelTextSpec.text = model?.spec
    }
}
