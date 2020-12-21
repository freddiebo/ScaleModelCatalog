//
//  FavoriteService.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 17.12.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//
// массивом: беру то что уже хронится, делаю append и пихаю обратно.

import Foundation

class FavoriteService {
    static let shared = FavoriteService()
    private let userDefaults = UserDefaults.standard
    
    private init() {}
    
    /*
    // Хранение моделей по отдельности
    func saveOneInFavs(model: Model) {
        do {
            let encodeModel = try PropertyListEncoder().encode(model)
            userDefaults.set(encodeModel,
                         forKey: model.id)
        } catch {
            print("Error add Model to Favorites")
        }
    }
    
    func getFavsModel(for id: String) -> Model? {
        var model: Model?
        if let dataModel = userDefaults.data(forKey: id) {
            model = try? PropertyListDecoder().decode(Model.self, from: dataModel)
            return model
        } else {
            return model
        }
    }*/
    
    // Массив избранных моделей
    
    // !!обернуть в escaping completion и на другой поток!!
    func saveInFavsArray(of models: [Model]) {
        let keyValue = "FavsModel"
        do {
            let encodeModel = try PropertyListEncoder().encode(models)
            userDefaults.set(encodeModel,
                         forKey: keyValue)
        } catch {
            print("Error add Model to Favorites")
        }
    }
    
    func getFavsModels() -> [Model]? {
        let keyValue = "FavsModel"
        var models: [Model]?
        if let dataModel = userDefaults.data(forKey: keyValue) {
            models = try? PropertyListDecoder().decode([Model].self, from: dataModel)
            return models
        } else {
            return models
        }
    }
    
}
