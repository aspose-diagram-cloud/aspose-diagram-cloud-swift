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
    internal let TestDataFolder = ""
    internal let File_TEST_GET = "file_get_1.vdx"
    internal let LocalTestSourceFile = "Source.vsd"
    internal let StorageTestFOLDER = "SDKTests/Swift"
    
    //This is only for test, please set your licence here
    internal let _appSid = "yourClientId"
    internal let _appKey = "yourClientSecret"
    

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
        
        AsposeDiagramCloudAPI.appSid = self._appSid
        AsposeDiagramCloudAPI.appKey = self._appKey
        
    }

    internal func uploadFile(name: String, folder: String = "Temp", completion: @escaping ()->Void) {
        
        var path = ""
        if (folder != "")
        {
            path = "\(folder)/\(name)"
        }
        else
        {
            path = name
        }
        
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
            if let response = response, response.uploaded!.count > 0 {
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
    
    internal func putCreate(path: String, file: URL, versionId: String? = nil, storage: String? = nil, completion: @escaping ((_ data: FilesUploadResult?,_ error: Error?) -> Void)) {
        
        StorageAPI.uploadFileWithRequestBuilder(path: path, file: file, storageName: storage).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
        
    }
    
}
