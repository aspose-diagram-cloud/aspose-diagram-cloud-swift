//
// HTMLSaveOptions.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public class HTMLSaveOptions: RenderingSaveOptions {

    public var pageCount: Int32?
    public var saveToolBar: Bool?
    public var exportHiddenPage: Bool?
    public var pageIndex: Int32?
    public var saveForegroundPagesOnly: Bool?
    public var title: String

public enum CodingKeys: String, CodingKey {
        case pageCount = "PageCount"
        case saveToolBar = "SaveToolBar"
        case exportHiddenPage = "ExportHiddenPage"
        case pageIndex = "PageIndex"
        case saveForegroundPagesOnly = "SaveForegroundPagesOnly"
        case title = "Title"
    }

    public init(saveFormat: SaveFormat?, defaultFont: String?, area: RectangleF?, exportGuideShapes: Bool?, pageSize: PageSize?, isExportComments: Bool?, pageCount: Int32?, saveToolBar: Bool?, exportHiddenPage: Bool?, pageIndex: Int32?, saveForegroundPagesOnly: Bool?, title: String) {
        self.pageCount = pageCount
        self.saveToolBar = saveToolBar
        self.exportHiddenPage = exportHiddenPage
        self.pageIndex = pageIndex
        self.saveForegroundPagesOnly = saveForegroundPagesOnly
        self.title = title
        super.init(saveFormat: saveFormat, defaultFont: defaultFont, area: area, exportGuideShapes: exportGuideShapes, pageSize: pageSize, isExportComments: isExportComments)
    }
    
    // Encodable protocol methods
    
    public override func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: String.self)
        
        try container.encodeIfPresent(pageCount, forKey: "PageCount")
        try container.encodeIfPresent(saveToolBar, forKey: "SaveToolBar")
        try container.encodeIfPresent(exportHiddenPage, forKey: "ExportHiddenPage")
        try container.encodeIfPresent(pageIndex, forKey: "PageIndex")
        
        try container.encodeIfPresent(saveForegroundPagesOnly, forKey: "SaveForegroundPagesOnly")
        try container.encodeIfPresent(title, forKey: "Title")
        try super.encode(to: encoder)
    }

    // Decodable protocol methods
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: String.self)
        
        pageCount = try container.decodeIfPresent(Int32.self, forKey: "PageCount")
        saveToolBar = try container.decodeIfPresent(Bool.self, forKey: "SaveToolBar")
        exportHiddenPage = try container.decodeIfPresent(Bool.self, forKey: "ExportHiddenPage")
        pageIndex = try container.decodeIfPresent(Int32.self, forKey: "PageIndex")
        
        saveForegroundPagesOnly = try container.decodeIfPresent(Bool.self, forKey: "SaveForegroundPagesOnly")
        title = try container.decodeIfPresent(String.self, forKey: "Title")!
        try super.init(from: decoder)
    }

}

