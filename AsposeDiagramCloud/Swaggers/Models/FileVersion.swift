//
// FileVersion.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation


/** File Version */

public class FileVersion: StorageFile {

    /** File Version ID. */
    public var versionId: String?
    /** Specifies whether the file is (true) or is not (false) the latest version of an file. */
    public var isLatest: Bool

public enum CodingKeys: String, CodingKey {
        case versionId = "VersionId"
        case isLatest = "IsLatest"
    }

    public init(name: String?, isFolder: Bool, modifiedDate: String?, size: Int64, path: String?, versionId: String?, isLatest: Bool) {
        self.versionId = versionId
        self.isLatest = isLatest
        super.init(name: name, isFolder: isFolder, modifiedDate: modifiedDate, size: size, path: path)
    }

    // Encodable protocol methods
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: String.self)
        
        try container.encodeIfPresent(versionId, forKey: "VersionId")
        try container.encodeIfPresent(isLatest, forKey: "IsLatest")
        
        try super.encode(to: encoder)
    }
    
    // Decodable protocol methods
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: String.self)
        
        versionId = try container.decodeIfPresent(String.self, forKey: "VersionId")
        isLatest = try container.decodeIfPresent(Bool.self, forKey: "IsLatest")!
        
        try super.init(from: decoder)
    }

}

