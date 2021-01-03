//
//  ViewController.swift
//  Example_UserDefaults
//
//  Created by ac1ra on 30.12.2020.
//

import UIKit

class ViewController: UIViewController {

    let userDefaults = UserDefaults.standard
    
    @IBOutlet weak var txtField_name: UITextField!
    @IBOutlet weak var txtField_noWhells: UITextField!
    @IBOutlet weak var txtField_color: UITextField!
    
    @IBAction func saveBttn(_ sender: UIButton) {

        let t = truck(pName: txtField_name.text!, pnoWhells: Int(txtField_noWhells.text ?? "") ?? 0, pColor: txtField_color.text!)
        let encodedName = NSKeyedArchiver.archivedData(withRootObject: t.Name)
        let encodedNoWhells = NSKeyedArchiver.archivedData(withRootObject: t.noWhells)
        let encodedColor = NSKeyedArchiver.archivedData(withRootObject: t.color)
        
        let encodeArray: [Data] = [encodedName, encodedNoWhells,encodedColor]
        
//        userDefaults.object(forKey: "truckItem")
        userDefaults.set(encodeArray, forKey: "truckItem")
//        (encodeArray, forKey: "truckItem")
        
        userDefaults.synchronize()
        print("Saved")
    }
    
    @IBAction func loadBttn(_ sender: UIButton) {
        
        var truckDataEncoded: [Data] = userDefaults.object(forKey: "truckItem") as! [Data]
        
        var unpackedName: String = NSKeyedUnarchiver.unarchiveObject(with: (truckDataEncoded[0] as NSData) as Data) as! String
        
        var unpackedNoWhells: Int = NSKeyedUnarchiver.unarchiveObject(with: (truckDataEncoded[1] as NSData) as Data) as! Int
        
        var unpackedColor: String = NSKeyedUnarchiver.unarchiveObject(with: (truckDataEncoded[2] as NSData) as Data) as! String

        
        let t = truck(pName: unpackedName, pnoWhells: unpackedNoWhells, pColor: unpackedColor)
        
        print(t.Name, t.noWhells, t.color)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

