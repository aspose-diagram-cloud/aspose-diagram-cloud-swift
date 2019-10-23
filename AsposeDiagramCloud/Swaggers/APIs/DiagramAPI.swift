//
// DiagramAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation
import Alamofire



open class DiagramAPI {
    /**
     Converts document from the request's content to the specified format.
     
     - parameter name: (path) Download document name. 
     - parameter file: (form) File to upload 
     - parameter sourceFilename: (query) Source document name. (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func convertDocument(name: String, file: URL, sourceFilename: String? = nil, completion: @escaping ((_ data: NSData?,_ error: Error?) -> Void)) {
        convertDocumentWithRequestBuilder(name: name, file: file, sourceFilename: sourceFilename).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Converts document from the request's content to the specified format.
     - PUT /diagram/{name}/convert
     - OAuth:
       - type: oauth2
       - name: JWT
     - examples: [{output=none}]
     
     - parameter name: (path) Download document name. 
     - parameter file: (form) File to upload 
     - parameter sourceFilename: (query) Source document name. (optional)

     - returns: RequestBuilder<NSData>
     */
    open class func convertDocumentWithRequestBuilder(name: String, file: URL, sourceFilename: String? = nil) -> RequestBuilder<NSData> {
        var path = "/diagram/{name}/convert"
        let namePreEscape = "\(name)"
        let namePostEscape = namePreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{name}", with: namePostEscape, options: .literal, range: nil)
        let URLString = AsposeDiagramCloudAPI.basePath + path
        let formParams: [String:Any?] = [
            "File": file
        ]

        let nonNullParameters = APIHelper.rejectNil(formParams)
        let parameters = APIHelper.convertBoolToString(nonNullParameters)
        
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
            "sourceFilename": sourceFilename
        ])

        let requestBuilder: RequestBuilder<NSData>.Type = AsposeDiagramCloudAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "PUT", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Create Empty file into the specified format.
     
     - parameter name: (path) The document name. 
     - parameter folder: (query) The document folder. (optional)
     - parameter isOverwrite: (query) If true overwrite the same name file.The default value is false  (optional, default to false)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func createNew(name: String, folder: String? = nil, isOverwrite: Bool? = nil, completion: @escaping ((_ data: CreateNewResponse?,_ error: Error?) -> Void)) {
        createNewWithRequestBuilder(name: name, folder: folder, isOverwrite: isOverwrite).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Create Empty file into the specified format.
     - PUT /diagram/{name}
     - OAuth:
       - type: oauth2
       - name: JWT
     - examples: [{contentType=application/json, example=""}]
     
     - parameter name: (path) The document name. 
     - parameter folder: (query) The document folder. (optional)
     - parameter isOverwrite: (query) If true overwrite the same name file.The default value is false  (optional, default to false)

     - returns: RequestBuilder<CreateNewResponse> 
     */
    open class func createNewWithRequestBuilder(name: String, folder: String? = nil, isOverwrite: Bool? = nil) -> RequestBuilder<CreateNewResponse> {
        var path = "/diagram/{name}"
        let namePreEscape = "\(name)"
        let namePostEscape = namePreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{name}", with: namePostEscape, options: .literal, range: nil)
        let URLString = AsposeDiagramCloudAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
            "folder": folder, 
            "IsOverwrite": isOverwrite
        ])

        let requestBuilder: RequestBuilder<CreateNewResponse>.Type = AsposeDiagramCloudAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "PUT", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Exports the document into the specified format.
     
     - parameter name: (path) The document name. 
     - parameter format: (query) The destination format. 
     - parameter folder: (query) Original document folder. (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func downloadFileWithFormat(name: String, format: String, folder: String? = nil, completion: @escaping ((_ data: NSData?,_ error: Error?) -> Void)) {
        downloadFileWithFormatWithRequestBuilder(name: name, format: format, folder: folder).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Exports the document into the specified format.
     - GET /diagram/{name}
     - OAuth:
       - type: oauth2
       - name: JWT
     - examples: [{output=none}]
     
     - parameter name: (path) The document name. 
     - parameter format: (query) The destination format. 
     - parameter folder: (query) Original document folder. (optional)

     - returns: RequestBuilder<NSData>
     */
    open class func downloadFileWithFormatWithRequestBuilder(name: String, format: String, folder: String? = nil) -> RequestBuilder<NSData> {
        var path = "/diagram/{name}"
        let namePreEscape = "\(name)"
        let namePostEscape = namePreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{name}", with: namePostEscape, options: .literal, range: nil)
        let URLString = AsposeDiagramCloudAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
            "format": format, 
            "folder": folder
        ])

        let requestBuilder: RequestBuilder<NSData>.Type = AsposeDiagramCloudAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Converts document to destination format with detailed settings and saves result to storage.
     
     - parameter name: (path) Original document name. 
     - parameter saveOptionsRequest: (body) Save options. 
     - parameter folder: (query) Original document folder. (optional)
     - parameter isOverwrite: (query) If true overwrite the same name file.The default value is false  (optional, default to false)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func saveAs(name: String, saveOptionsRequest: SaveOptionsRequest, folder: String? = nil, isOverwrite: Bool? = nil, completion: @escaping ((_ data: SaveAsResponse?,_ error: Error?) -> Void)) {
        saveAsWithRequestBuilder(name: name, saveOptionsRequest: saveOptionsRequest, folder: folder, isOverwrite: isOverwrite).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Converts document to destination format with detailed settings and saves result to storage.
     - POST /diagram/{name}/saveAs
     - OAuth:
       - type: oauth2
       - name: JWT
     - examples: [{contentType=application/json, example=""}]
     
     - parameter name: (path) Original document name. 
     - parameter saveOptionsRequest: (body) Save options. 
     - parameter folder: (query) Original document folder. (optional)
     - parameter isOverwrite: (query) If true overwrite the same name file.The default value is false  (optional, default to false)

     - returns: RequestBuilder<SaveAsResponse> 
     */
    open class func saveAsWithRequestBuilder(name: String, saveOptionsRequest: SaveOptionsRequest, folder: String? = nil, isOverwrite: Bool? = nil) -> RequestBuilder<SaveAsResponse> {
        var path = "/diagram/{name}/saveAs"
        let namePreEscape = "\(name)"
        let namePostEscape = namePreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{name}", with: namePostEscape, options: .literal, range: nil)
        let URLString = AsposeDiagramCloudAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: saveOptionsRequest)

        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
            "folder": folder, 
            "IsOverwrite": isOverwrite
        ])

        let requestBuilder: RequestBuilder<SaveAsResponse>.Type = AsposeDiagramCloudAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

}
