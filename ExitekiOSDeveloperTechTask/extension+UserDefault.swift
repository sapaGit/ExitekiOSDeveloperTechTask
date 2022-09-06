//
//  extension+UserDefault.swift
//  ExitekiOSDeveloperTechTask
//
//  Created by Sergey Pavlov on 05.09.2022.
//

import Foundation


extension UserDefaults {
    var mobiles: Set<Mobile> {
        get {
            guard let data = UserDefaults.standard.data(forKey: "mobiles") else { return Set<Mobile>() }
            return (try? PropertyListDecoder().decode(Set<Mobile>.self, from: data)) ?? Set<Mobile>()
        }
        set {
            UserDefaults.standard.set(try? PropertyListEncoder().encode(newValue), forKey: "mobiles")
        }
    }
}
