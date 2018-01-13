//
//  ObjectResponse.swift
//  HoliduTestApp
//
//  Created by Dmitry Poznukhov on 13.01.18.
//  Copyright © 2018 Dmitry inc. All rights reserved.
//

import Foundation

enum ObjectResponse<ObjectType> {
    case success(ObjectType)
    case error
}
