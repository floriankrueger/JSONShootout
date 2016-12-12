//
//  Program+Himotoki.swift
//  JSONShootout
//
//  Created by Florian Krüger on 12/12/2016.
//  Copyright © 2016 SwiftBit. All rights reserved.
//

import Himotoki

extension Program: Decodable {
    public static func decode(_ e: Extractor) throws -> Program {
        return try Program(
            title:          (e <|? "Title") ?? "",
            chanId:         (e <|? [ "channel", "ChanId" ]) ?? "",
            description:    e <|? "Description",
            subtitle:       e <|? "SubTitle",
            recording:      e <| "Recording",
            season:         (e <|? "Season").flatMap({ Int($0) }),
            episode:        (e <|? "Episode").flatMap({ Int($0) })
        )
    }
}
