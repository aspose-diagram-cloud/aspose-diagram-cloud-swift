//
// FilesUploadResult.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation


/** File upload result */

public struct FilesUploadResult: Codable {

    /** List of uploaded file names */
    public var uploaded: [String]?
    /** List of errors. */
    public var errors: [ErrorInfo]?

public enum CodingKeys: String, CodingKey { 
        case uploaded = "Uploaded"
        case errors = "Errors"
    }

    public init(uploaded: [String]?, errors: [ErrorInfo]?) {
        self.uploaded = uploaded
        self.errors = errors
    }


}

