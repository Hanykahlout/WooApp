//
//  ResultExtention.swift
//  WooApp
//
//  Created by Dev. Hany Alkahlout on 29/11/2021.
//

import Foundation
import RealmSwift

extension Results {
    func toArray<T>(ofType: T.Type) -> [T] {
        var array = [T]()
        for i in 0 ..< count {
            if let result = self[i] as? T {
                array.append(result)
            }
        }

        return array
    }
}
