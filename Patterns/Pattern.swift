//
//  Pattern.swift
//  Patterns
//
//  Created by VIJAY VENKATESH on 7/6/15.
//  Copyright (c) 2015 VIJAY VENKATESH. All rights reserved.
//

import Foundation
import CoreData

class Pattern: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var frontImage: NSData
    @NSManaged var backImage: NSData

}
