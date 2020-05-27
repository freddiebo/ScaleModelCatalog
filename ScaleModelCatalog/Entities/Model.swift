//  Класс для описания модели
//  name - Название модели
//  spec - Описание/спецификация модели
//  name - Фотграфия модели
//
//  Created by  Vladislav Bondarev on 18.03.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import UIKit
import Moya

struct Model: Codable {
    let id: String
    let name: String
    let spec: String
    let image: String
    let manufacturer: String
    
    /*func loadImage() -> UIImage? {
        var loadedImage = UIImage(named: "NoImage.png")
        if let url = URL(string:self.image) {
            if let data = try? Data(contentsOf: url) {
                loadedImage = UIImage(data: data)
            }
            else {
                let nameImage = id + ".jpg"
                loadedImage = UIImage(named: nameImage)
            }
        }
        return loadedImage
    }
    
    func load(completion: @escaping (_ image: UIImage?) -> Void) {
        var loadedImage = UIImage(named: "NoImage.png")
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let url = URL(string: self.image)
        let task = session.dataTask(with: url!, completionHandler: {
            (data, response, error) in
            if let data = data {
                do {
                    loadedImage = UIImage(data: data)
                } catch {
                    let nameImage = self.id + ".jpg"
                    loadedImage = UIImage(named: nameImage)
                    print("Error")
                }
            }
            DispatchQueue.main.async {
                completion(loadedImage)
            }
        })
        task.resume()
    }*/
    
    func getModels(completion: @escaping (_ image: UIImage?) -> Void) {
        let cache = NSCache<NSString,UIImage>()
        var loadedImage = UIImage(named: "NoImage.png")
        let provide = MoyaProvider<Network>()
        if let cachedVersion = cache.object(forKey: NSString(string: id)) {
            loadedImage = cachedVersion
            completion(loadedImage)
        } else {
            provide.request(.image(self.image), completion: { result in
                switch result {
                case .success(let response):
                    let data = response.data
                    loadedImage = UIImage(data: data)
                    cache.setObject(loadedImage!, forKey: NSString(string: self.id))
                case .failure(let error):
                    let nameImage = self.id + ".jpg"
                    loadedImage = UIImage(named: nameImage)
                    cache.setObject(loadedImage!, forKey: NSString(string: self.id))
                    print(error.errorDescription ?? "Unknown error")
                }
                DispatchQueue.main.async {
                    completion(loadedImage)
                }
            })
        }
    }
}
