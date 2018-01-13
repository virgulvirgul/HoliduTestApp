//
//  Injectable.swift
//  HoliduTestApp
//
//  Created by Dmitry Poznukhov on 13.01.18.
//  Copyright © 2018 Dmitry inc. All rights reserved.
//

import Foundation

public protocol Injectable {
    associatedtype InjectionType

    var injected: InjectionType { get set }
}
