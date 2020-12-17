//  Класс для описания модели
//  name - Название модели
//  spec - Описание/спецификация модели
//  name - Фотграфия модели
//
//  Created by  Vladislav Bondarev on 18.03.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import UIKit

struct Model: Codable {
    let id: String
    let name: String
    let spec: String
    let image: String
    let manufacturer: String
    let isInFavs: Bool = true
}
