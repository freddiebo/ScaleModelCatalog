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

protocol ServerServiceProtocol {
    func getSortModels(pathPagesString: String, completion: @escaping (_ listof: [Model]) -> Void)
    func getPagesModel(pathPagesString: String, completion: @escaping (_ models: [Model]) -> Void)
    func getImageModel(with id: String,
                       from url: String,
                       completion: @escaping (_ image: UIImage?) -> Void)
}

class ServerService {
    static let shared = ServerService()
    
    private init() {}
    
    private let cache = NSCache<NSString,UIImage>()
    private let provider = MoyaProvider<Network>()
}

extension ServerService: ServerServiceProtocol {
    func getSortModels(pathPagesString: String, completion: @escaping (_ listof: [Model]) -> Void) {
        provider.request(.modelPages(pathPagesString),completion: { result in
            switch result {
            case .success(let response):
                do {
                    let extlist = try response.map([Model].self)
                    DispatchQueue.main.async {
                        completion(extlist)
                    }
                }
                catch {
                    print("this error \(error)")
                }
            case .failure(let error):
                print(error.errorDescription ?? "Unknown error")
            }
        })
    }
    
    func getPagesModel(pathPagesString: String, completion: @escaping (_ models: [Model]) -> Void) {
        provider.request(.modelPages(pathPagesString),completion: { result in
            switch result {
            case .success(let response):
                do {
                    let pageOfModels = try response.map([Model].self)
                    DispatchQueue.main.async {
                        completion(pageOfModels)
                    }
                }
                catch {
                    print("this error \(error)")
                }
            case .failure(let error):
                print(error.errorDescription ?? "Unknown error")
            }
        })
    }
    
    func getImageModel(with id: String, from url: String, completion: @escaping (_ image: UIImage?) -> Void) {
        var loadedImage = UIImage(named: "NoImage.png")
        if let cachedVersion = cache.object(forKey: NSString(string: id)) {
            loadedImage = cachedVersion
            completion(loadedImage)
        } else {
            provider.request(.image(url), completion: { result in
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
