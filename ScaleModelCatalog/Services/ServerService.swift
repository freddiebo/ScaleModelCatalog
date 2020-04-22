//
//  ServerService.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 10.04.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import Foundation
import UIKit

class ServerService {
    static let shared = ServerService()
    
    private init() {}
    
    var list = [Model]()
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
                    print(self.list)
                } catch {
                    print("Error")
                }
            }
        })
        task.resume()
    }
}
