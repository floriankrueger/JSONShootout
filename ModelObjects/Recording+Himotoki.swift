//
//  Recording+Himotoki.swift
//  JSONShootout
//
//  Created by Florian Krüger on 12/12/2016.
//  Copyright © 2016 SwiftBit. All rights reserved.
//

import Himotoki

extension Recording: Decodable {
    public static func decode(_ e: Extractor) throws -> Recording {
        return try Recording(
            startTsStr: e <| "StartTs",
            status:     (e <|? "Status").flatMap({ Status(rawValue: $0) }) ?? .Unknown,
            recordId:   e <| "RecordId",
            recGroup:   (e <|? "RecGroup").flatMap({ RecGroup(rawValue: $0) }) ?? .Unknown
        )
    }
}
