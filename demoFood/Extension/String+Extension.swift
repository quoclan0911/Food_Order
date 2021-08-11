//
//  String+Extension.swift
//  demoFood
//
//  Created by ASU on 7/6/21.
//  Copyright © 2021 DiepLan. All rights reserved.
//

import Foundation

extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
