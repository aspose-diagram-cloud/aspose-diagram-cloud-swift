//
// UploadResponse.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct UploadResponse: Codable {

    public var uploaded: String?

public enum CodingKeys: String, CodingKey { 
        case uploaded = "Uploaded"
    }

    public init(uploaded: String?) {
        self.uploaded = uploaded
    }


}

