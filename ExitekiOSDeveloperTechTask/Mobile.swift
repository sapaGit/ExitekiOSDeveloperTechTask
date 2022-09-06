//
//  Mobile.swift
//  ExitekiOSDeveloperTechTask
//
//  Created by Sergey Pavlov on 05.09.2022.
//

// Implement mobile phone storage protocol
// Requirements:
// - Mobiles must be unique (IMEI is an unique number)
// - Mobiles must be stored in memory


import Foundation

protocol MobileStorage {
    func getAll() -> Set<Mobile>
    func findByImei(_ imei: String) -> Mobile?
    func save(_ mobile: Mobile) throws -> Mobile
    func delete(_ product: Mobile) throws
    func exists(_ product: Mobile) -> Bool
}

struct Mobile: Hashable, Codable {
    var imei: String
    var model: String
}
enum StorageError: Error {
    case imeiAlreadyExist
}

class Mobiles: MobileStorage, Codable {

    func getAll() -> Set<Mobile> {
        return UserDefaults.standard.mobiles
    }
    
    func findByImei(_ imei: String) -> Mobile? {
        for mobile in UserDefaults.standard.mobiles {
            if mobile.imei == imei {
                return Optional(mobile)
            }
        }
        return nil
    }
    
    func save(_ mobile: Mobile) throws -> Mobile {
        if UserDefaults.standard.mobiles.isEmpty {
            UserDefaults.standard.mobiles = [.init(imei: mobile.imei, model: mobile.model)]
        } else {
            for device in UserDefaults.standard.mobiles {
                if mobile.imei == device.imei {
                    throw StorageError.imeiAlreadyExist
                }
            }
            UserDefaults.standard.mobiles.insert(mobile)
        }
        return mobile
    }
    
    func delete(_ product: Mobile) throws {
        for device in UserDefaults.standard.mobiles {
            if product == device {
                UserDefaults.standard.mobiles.remove(device)
            }
        }
    }
    func exists(_ product: Mobile) -> Bool {
            for device in UserDefaults.standard.mobiles {
            if product == device {
                return true
            }
        }
        return false
    }
}


