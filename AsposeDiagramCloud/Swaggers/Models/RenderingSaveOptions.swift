//
// RenderingSaveOptions.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public class RenderingSaveOptions: SaveOptionsModel {

    public var area: RectangleF?
    public var exportGuideShapes: Bool?
    public var pageSize: PageSize?
    public var isExportComments: Bool?

public enum CodingKeys: String, CodingKey {
        case area = "Area"
        case exportGuideShapes = "ExportGuideShapes"
        case pageSize = "PageSize"
        case isExportComments = "IsExportComments"
    }

    public init(saveFormat: SaveFormat?, defaultFont: String?, area: RectangleF?, exportGuideShapes: Bool?, pageSize: PageSize?, isExportComments: Bool?) {
        //self.saveFormat = saveFormat
        //self.defaultFont = defaultFont
        self.area = area
        self.exportGuideShapes = exportGuideShapes
        self.pageSize = pageSize
        self.isExportComments = isExportComments
        super.init(saveFormat: saveFormat, defaultFont: defaultFont)
    }

    // Encodable protocol methods
    
    public override func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: String.self)
        
        try container.encodeIfPresent(area, forKey: "Area")
        try container.encodeIfPresent(exportGuideShapes, forKey: "ExportGuideShapes")
        try container.encodeIfPresent(pageSize, forKey: "PageSize")
        try container.encodeIfPresent(isExportComments, forKey: "IsExportComments")
        try super.encode(to: encoder)
    }
    
    // Decodable protocol methods
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: String.self)
        
        area = try container.decodeIfPresent(RectangleF.self, forKey: "Area")
        exportGuideShapes = try container.decodeIfPresent(Bool.self, forKey: "ExportGuideShapes")
        pageSize = try container.decodeIfPresent(PageSize.self, forKey: "PageSize")
        isExportComments = try container.decodeIfPresent(Bool.self, forKey: "IsExportComments")
        try super.init(from: decoder)
    }

}
