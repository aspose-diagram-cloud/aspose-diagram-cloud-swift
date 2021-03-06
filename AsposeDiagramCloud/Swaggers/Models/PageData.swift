//
// PageData.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct PageData: Codable {

    /** Page Id */
    public var ID: Int32
    /** page setting info */
    public var pageSetting: PageSetting?
    /** shape list */
    public var shapes: [ShapeData]?

public enum CodingKeys: String, CodingKey { 
        case ID = "ID"
        case pageSetting = "PageSetting"
        case shapes = "Shapes"
    }

    public init(ID: Int32, pageSetting: PageSetting?, shapes: [ShapeData]?) {
        self.ID = ID
        self.pageSetting = pageSetting
        self.shapes = shapes
    }


}

