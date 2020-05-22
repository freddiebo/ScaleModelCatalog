//
//  ServiceMoya.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 07.05.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import Moya

public enum Network {
    case modelPages(String)
    case models
    case image(String)
}

extension Network: TargetType {
    public var baseURL: URL {
        switch self {
        //case .modelsPage: return URL(string: "https://5ebeb77bec800c0016043dfc.mockapi.io/Model?page=1&limit=3")!
        case .modelPages(let path): return URL(string: "https://5ebeb77bec800c0016043dfc.mockapi.io/Model\(path)")!
        case .models: return URL(string: "http://www.mocky.io/v2/5e9823c23500005200c47ecb")!
        case .image(let path): return URL(string: path)!
        }
    }
    
    public var path: String {
        return ""
    }
    
    public var method: Method {
        return .get
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        return .requestPlain
    }
    
    public var headers: [String : String]? {
        return ["Models":"ScaleCar"]
    }
    
    
}
