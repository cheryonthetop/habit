//
//  Habit+CoreDataProperties.swift
//  Habit
//
//  Created by Yingfan Chen on 9/21/19.
//  Copyright © 2019 Kyle Lee. All rights reserved.
//
//

import Foundation
import CoreData


extension Habit {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Habit> {
        return NSFetchRequest<Habit>(entityName: "Habit")
    }

    @NSManaged public var name: String?

}
