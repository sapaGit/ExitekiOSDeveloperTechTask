//
//  ViewController.swift
//  ExitekiOSDeveloperTechTask
//
//  Created by Sergey Pavlov on 05.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Create array of Mobile() objects
        let mobilesArray = [Mobile(imei: "123", model: "iPhone"),
                            Mobile(imei: "234", model: "Sony"),
                            Mobile(imei: "123", model: "Samsung"),
                            Mobile(imei: "345", model: "Xiaomi")]
        
        //Create Mobiles() object
        let mobiles = Mobiles()
        
        //Try save() method
        for mobile in mobilesArray {
            do { try print("Succesful saved \(mobiles.save(mobile))")
            } catch {
                print(error) }
        }
        
        //Try getAll() method
        print(mobiles.getAll())
        
        //Try exists() method
        print(mobiles.exists(mobilesArray[1]))
        print(mobiles.exists(mobilesArray[2]))
        
        //Try delete() method
        do { try
            mobiles.delete(mobilesArray[0])
            print("Succesful deleted")
        } catch {
            print(error)
        }
        
        //Try findByImei() method
        print(mobiles.findByImei("123") ?? "There is no such imei")
        print(mobiles.findByImei("234") ?? "There is no such imei")
    }
}

