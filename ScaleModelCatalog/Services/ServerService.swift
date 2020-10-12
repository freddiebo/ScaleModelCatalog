//
//  ServerService.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 10.04.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import Moya
import Foundation
import UIKit

class ServerService {
    static let shared = ServerService()
    
    private init() {}
    
    var pathPages = ""
    var pagesModel = [Model]()
    var pagesSortModel = [Model]()
    let cache = NSCache<NSString,UIImage>()
    
    func getSortModels(completion: @escaping (_ listof: [Model]) -> Void) {
        let provide = MoyaProvider<Network>()
        provide.request(.modelPages(self.pathPages),completion: { result in
            switch result {
            case .success(let response):
                do {
                    let extlist = try response.map([Model].self)
                    DispatchQueue.main.async {
                        completion(extlist)
                    }
                }
                catch {
                    print("this error")
                }
            case .failure(let error):
                print(error.errorDescription ?? "Unknown error")
            }
        })
    }
    
    func getPagesModel(completion: @escaping (_ models: [Model]) -> Void) {
        let provide = MoyaProvider<Network>()
        provide.request(.modelPages(self.pathPages),completion: { result in
            switch result {
            case .success(let response):
                do {
                    self.pagesModel.append(contentsOf: try response.map([Model].self))
                    DispatchQueue.main.async {
                        completion(self.pagesModel)
                    }
                }
                catch {
                    print("this error")
                }
            case .failure(let error):
                print(error.errorDescription ?? "Unknown error")
            }
        })
    }
    
    func getImageModel(with id: String, from url: String, completion: @escaping (_ image: UIImage?) -> Void) {
        var loadedImage = UIImage(named: "NoImage.png")
        let provide = MoyaProvider<Network>()
        if let cachedVersion = cache.object(forKey: NSString(string: id)) {
            loadedImage = cachedVersion
            completion(loadedImage)
        } else {
            provide.request(.image(url), completion: { result in
                switch result {
                case .success(let response):
                    let data = response.data
                    if let newImage = UIImage(data: data) {
                        self.cache.setObject(newImage, forKey: NSString(string: id))
                        loadedImage = newImage
                    }
                case .failure(let error):
                    let nameImage = id + ".jpg"
                    if let newImage = UIImage(named: nameImage) {
                        self.cache.setObject(newImage, forKey: NSString(string: id))
                        loadedImage = newImage
                    }
                    print(error.errorDescription ?? "Unknown error")
                }
                DispatchQueue.main.async {
                    completion(loadedImage)
                }
            })
        }
    }
}
