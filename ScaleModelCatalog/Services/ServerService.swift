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
    var list = [Model]()
    var extlist = [Model]()
    var pagesModel = [Model]()
    var models: [Model] {
        if let url = URL(string: urlModelSource) {
            if let data = try? Data(contentsOf: url) {
                return parse(json: data)
            }
        }
        return []
    }
    
    var urlModelSource: String {
        return "http://www.mocky.io/v2/5e9823c23500005200c47ecb"
        //"http://www.mocky.io/v2/5e8747f03100000aff81a520"
        //"http://www.mocky.io/v2/5e8746733100008af581a50e"
    }
    
    private func parse(json: Data) -> [Model] {
        let decoder = JSONDecoder()
        if let jsonModels = try? decoder.decode(Models.self, from: json) {
            return jsonModels.body
        }
        return []
    }
    
    func loadModels(completion: @escaping (_ listof: [Model]) -> Void) {
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let url = URL(string: urlModelSource)
        let task = session.dataTask(with: url!, completionHandler: {
            (data, response, error) in
            if let data = data {
                do {
                    self.list = self.parse(json: data)
                    DispatchQueue.main.async {
                        completion(self.list)
                    }
                    //print(self.list)
                } catch {
                    print("Error")
                }
            }
        })
        task.resume()
    }
    
    func getModels(completion: @escaping (_ listof: [Model]) -> Void) {
        let provide = MoyaProvider<Network>()
        provide.request(.models,completion: { result in
            switch result {
            case .success(let response):
                do {
                    let extlist = try response.map(Models.self).body
                    //print(extlist)
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
        print("load \(pathPages)")
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
}
