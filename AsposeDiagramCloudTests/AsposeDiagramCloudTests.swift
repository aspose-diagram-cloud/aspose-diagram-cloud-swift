//
//  AsposeDiagramCloudTests.swift
//  AsposeDiagramCloudTests
//
//  Created by leo luo on 2019/1/23.
//  Copyright © 2019年 leo luo. All rights reserved.
//

import XCTest
@testable import AsposeDiagramCloud

class AsposeDiagramCloudTests: XCTestCase {
    
    internal let TEMPFOLDER = "Temp"
    internal let testTimeout: TimeInterval = 60.0
    internal let TestDataFolder = "";
    internal let File_TEST_GET = "file_get_1.vdx";


    override func setUp() {
        super.setUp()
        
        // read App Key and App Sid from setup.json file
        // Get App key and App SID from https://cloud.aspose.com
        readSettings()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    private func readSettings() {
        
        //This is only for test, please set your licence here
        AsposeDiagramCloudAPI.appSid = "84220e69-32e2-41c4-ba2f-662a0a01433e"
        AsposeDiagramCloudAPI.appKey = "883dc8d6b8ecd879dae35cb363e9eb56"
        
    }

    internal func uploadFile(name: String, folder: String = "Temp", completion: @escaping ()->Void) {
        let path = "\(folder)/\(name)"
        
        let url: URL? = getURL(name)
        if (nil == url) {
            XCTFail("no file found \(name)")
            return
        }
        
        self.putCreate(path: path, file: url!) {
            (response, error) in
            guard error == nil else {
                XCTFail("error uploading file \(name)")
                return
            }
            if let response = response, response.code == HttpStatusCode.ok.rawValue {
                completion()
            } else {
                XCTFail("error uploading file \(name)")
            }
            
        }
        
    }
    
    internal func uploadFiles(names: [String], completion: @escaping ()->Void) {
        
        var _names = names
        
        if names.count > 1 {
            uploadFile(name: _names.removeFirst()) {
                self.uploadFiles(names: _names, completion: completion)
            }
        } else if names.count == 1 {
            uploadFile(name: _names.removeFirst(), completion: completion)
        } else {
            completion()
        }
        
    }
    
    internal func getURL(_ name: String) -> URL? {
        let bundle = Bundle(for: type(of: self))
        return bundle.url(forResource: name, withExtension: nil)
    }
    
    internal func putCreate(path: String, file: URL, versionId: String? = nil, storage: String? = nil, completion: @escaping ((_ data: SaaSposeResponse?,_ error: Error?) -> Void)) {
        self.putCreateWithRequestBuilder(path: path, file: file, versionId: versionId, storage: storage).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }
    
    internal func putCreateWithRequestBuilder(path: String, file: URL, versionId: String? = nil, storage: String? = nil) -> RequestBuilder<SaaSposeResponse> {
        let pathUrl = "/storage/file/\(self.TEMPFOLDER)"
        let URLString = AsposeDiagramCloudAPI.basePath + pathUrl
        let formParams: [String:Any?] = [
            "File": file
        ]
        
        let nonNullParameters = APIHelper.rejectNil(formParams)
        let parameters = APIHelper.convertBoolToString(nonNullParameters)
        
        let urlObj = NSURLComponents(string: URLString)
        urlObj?.queryItems = APIHelper.mapValuesToQueryItems([
            "path": path,
            "versionId": versionId,
            "storage": storage
            ])
        
        
        let requestBuilder: RequestBuilder<SaaSposeResponse>.Type = AsposeDiagramCloudAPI.requestBuilderFactory.getBuilder()
        
        return requestBuilder.init(method: "PUT", URLString: (urlObj?.string ?? URLString), parameters: parameters, isBody: false)
    }

}
