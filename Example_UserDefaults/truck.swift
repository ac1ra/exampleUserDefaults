//
//  truck.swift
//  Example_UserDefaults
//
//  Created by ac1ra on 30.12.2020.
//

import Foundation
class truck {
    var Name = String()
    var noWhells = Int()
    var color = String()
    
    init(pName: String, pnoWhells: Int, pColor:String) {
        Name = pName
        noWhells = pnoWhells
        color = pColor
    }
 
//We need this to save & load data from NSUSerDefaults
init(coder aDecoder: NSCoder!){
    self.Name = aDecoder.decodeObject(forKey: "Name") as! String
    self.noWhells = aDecoder.decodeObject(forKey: "noWhells") as! Int
    self.color = aDecoder.decodeObject(forKey: "color") as! String
    }
    
    func initWithCoder(aDecoder: NSCoder) -> truck {
        self.Name = aDecoder.decodeObject(forKey: "Name") as! String
        self.noWhells = aDecoder.decodeObject(forKey: "noWhells") as! Int
        self.color = aDecoder.decodeObject(forKey: "color") as! String
        return self
    }
    func encodeWithCoder(aCoder: NSCoder!) {
        aCoder.encode(Name, forKey: "Name")
        aCoder.encode(noWhells, forKey: "noWhells")
        aCoder.encode(color, forKey: "color")
    }
}
