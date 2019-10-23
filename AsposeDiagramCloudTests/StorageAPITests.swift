//
// StorageAPITests.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import XCTest
@testable import AsposeDiagramCloud


class StorageAPITests: AsposeDiagramCloudTests {

	override func setUp() 
	{
		super.setUp()
		// Put setup code here. This method is called before the invocation of each test method in the class.
		let expectation = self.expectation(description: "StorageAPITestsSetUp")
		AuthAspose.checkAuth()
		{
			(authError) in
			guard authError == nil else {
			    XCTFail("error StorageAPITestsSetUp")
			    return
			}
			expectation.fulfill() 
		}
		self.waitForExpectations(timeout: testTimeout, handler: nil)
	}
	
	override func tearDown() 
	{
		// Put teardown code here. This method is called after the invocation of each test method in the class.
		super.tearDown()
	}

	func testcopyFile() 
	{
		let expectation = self.expectation(description: "testcopyFile")
        let name:String = LocalTestSourceFile
		let srcPath:String = LocalTestSourceFile
		let destPath:String = "\(TEMPFOLDER)/\(LocalTestSourceFile)"
		let srcStorageName:String? = nil
		let destStorageName:String? = nil
		let versionId:String? = nil
		
		uploadFile(name: name, folder: "") {
			StorageAPI.copyFile(srcPath: srcPath, destPath: destPath, srcStorageName: srcStorageName, destStorageName: destStorageName, versionId: versionId)
			{
				(response, error) in
				guard error == nil else {
					XCTFail("error testcopyFile")
					return
				}
	
                if response != nil {
					//XCTAssertEqual(response.code, 200)
					expectation.fulfill()
				}
			}
		}
		self.waitForExpectations(timeout: testTimeout, handler: nil)		
	}

	func testcopyFolder() 
	{
		let expectation = self.expectation(description: "testcopyFolder")
		let srcPath:String = TEMPFOLDER
		let destPath:String = TEMPFOLDER + "2"
		let srcStorageName:String? = nil
		let destStorageName:String? = nil
		
        StorageAPI.copyFolder(srcPath: srcPath, destPath: destPath, srcStorageName: srcStorageName, destStorageName: destStorageName)
        {
            (response, error) in
            guard error == nil else {
                XCTFail("error testcopyFolder")
                return
            }

            if response != nil {
                //XCTAssertEqual(response.code, 200)
                expectation.fulfill()
            }
        }
		self.waitForExpectations(timeout: testTimeout, handler: nil)		
	}

	func testcreateFolder() 
	{
		let expectation = self.expectation(description: "testcreateFolder")
		let path:String = TEMPFOLDER + "11"
		let storageName:String? = nil
		
        StorageAPI.createFolder(path: path, storageName: storageName)
        {
            (response, error) in
            guard error == nil else {
                XCTFail("error testcreateFolder")
                return
            }

            if response != nil {
                //XCTAssertEqual(response.code, 200)
                expectation.fulfill()
            }
        }
		self.waitForExpectations(timeout: testTimeout, handler: nil)		
	}

	func testdeleteFile() 
	{
		let expectation = self.expectation(description: "testdeleteFile")
        let name:String = LocalTestSourceFile
        let path:String = "\(TEMPFOLDER)/\(name)"
		let storageName:String? = nil
		let versionId:String? = nil

        StorageAPI.deleteFile(path: path, storageName: storageName, versionId: versionId)
        {
            (response, error) in
            guard error == nil else {
                XCTFail("error testdeleteFile")
                return
            }

            if response != nil {
                //XCTAssertEqual(response.code, 200)
                expectation.fulfill()
            }
        }
		self.waitForExpectations(timeout: testTimeout, handler: nil)		
	}

	func testdeleteFolder() 
	{
		let expectation = self.expectation(description: "testdeleteFolder")
		let path:String = TEMPFOLDER + "11"
		let storageName:String? = nil
		let recursive:Bool? = nil
		
        StorageAPI.deleteFolder(path: path, storageName: storageName, recursive: recursive)
        {
            (response, error) in
            guard error == nil else {
                XCTFail("error testdeleteFolder")
                return
            }

            if response != nil {
                //XCTAssertEqual(response.code, 200)
                expectation.fulfill()
            }
        }
		self.waitForExpectations(timeout: testTimeout, handler: nil)		
	}

	func testdownloadFile() 
	{
		let expectation = self.expectation(description: "testdownloadFile")
		let path:String = LocalTestSourceFile
		let storageName:String? = nil
		let versionId:String? = nil
		
		uploadFile(name: path, folder: "") {
			StorageAPI.downloadFile(path: path, storageName: storageName, versionId: versionId)
			{
				(response, error) in
				guard error == nil else {
					XCTFail("error testdownloadFile")
					return
				}
	
				if let response = response {
                    //response Data, we may write it down and check it.
                    let fileName = "testdownloadFile.vsd"
                    let filePath = NSHomeDirectory()
                    let fileManager = FileManager.default
                    let path = "\(filePath)/tmp/\(fileName)"
                    fileManager.createFile(atPath: path, contents:nil, attributes:nil)
                    let handle = FileHandle(forWritingAtPath:path)
                    handle?.write(response as Data)
                    expectation.fulfill()
				}
			}
		}
		self.waitForExpectations(timeout: testTimeout, handler: nil)		
	}

	func testgetDiscUsage() 
	{
		let expectation = self.expectation(description: "testgetDiscUsage")
		let storageName:String? = nil
		
        StorageAPI.getDiscUsage(storageName: storageName)
        {
            (response, error) in
            guard error == nil else {
                XCTFail("error testgetDiscUsage")
                return
            }

            if let response = response {
                //XCTAssertEqual(response.code, 200)
                print("Disc totalSize(Byte):" + String(response.totalSize))
                print("Disc usedSize(Byte):" + String(response.usedSize))
                expectation.fulfill()
            }
        }
		self.waitForExpectations(timeout: testTimeout, handler: nil)		
	}

	func testgetFileVersions() 
	{
		let expectation = self.expectation(description: "testgetFileVersions")
		let path:String = LocalTestSourceFile
		let storageName:String? = nil
		
		uploadFile(name: path, folder: "") {
			StorageAPI.getFileVersions(path: path, storageName: storageName)
			{
				(response, error) in
				guard error == nil else {
					XCTFail("error testgetFileVersions")
					return
				}
	
				if let response = response {
                    //XCTAssertEqual(response.code, 200)
                    XCTAssertTrue(response.value!.count > 0)
					expectation.fulfill()
				}
			}
		}
		self.waitForExpectations(timeout: testTimeout, handler: nil)		
	}

	func testgetFilesList() 
	{
		let expectation = self.expectation(description: "testgetFilesList")
		let path:String = TEMPFOLDER
		let storageName:String? = nil

        StorageAPI.getFilesList(path: path, storageName: storageName)
        {
            (response, error) in
            guard error == nil else {
                XCTFail("error testgetFilesList")
                return
            }

            if let response = response {
                XCTAssertTrue(response.value!.count >= 0)
                expectation.fulfill()
            }
        }
		self.waitForExpectations(timeout: testTimeout, handler: nil)		
	}

	func testmoveFile() 
	{
		let expectation = self.expectation(description: "testmoveFile")
        let name = LocalTestSourceFile
		let srcPath:String = LocalTestSourceFile
		let destPath:String = "\(TEMPFOLDER)/\(name)"
		let srcStorageName:String? = nil
		let destStorageName:String? = nil
		let versionId:String? = nil
		
		uploadFile(name: name, folder: "") {
			StorageAPI.moveFile(srcPath: srcPath, destPath: destPath, srcStorageName: srcStorageName, destStorageName: destStorageName, versionId: versionId)
			{
				(response, error) in
				guard error == nil else {
					XCTFail("error testmoveFile")
					return
				}
	
                if response != nil {
					//XCTAssertEqual(response.code, 200)
					expectation.fulfill()
				}
			}
		}
		self.waitForExpectations(timeout: testTimeout, handler: nil)		
	}

	func testmoveFolder() 
	{
		let expectation = self.expectation(description: "testmoveFolder")
        let srcPath:String = TEMPFOLDER + "2"
        let destPath:String = TEMPFOLDER + "3"
		let srcStorageName:String? = nil
		let destStorageName:String? = nil
		
        StorageAPI.moveFolder(srcPath: srcPath, destPath: destPath, srcStorageName: srcStorageName, destStorageName: destStorageName)
        {
            (response, error) in
            guard error == nil else {
                XCTFail("error testmoveFolder")
                return
            }

            if response != nil {
                //XCTAssertEqual(response.code, 200)
                expectation.fulfill()
            }
        }
		self.waitForExpectations(timeout: testTimeout, handler: nil)		
	}

	func testobjectExists() 
	{
		let expectation = self.expectation(description: "testobjectExists")
		let path:String = LocalTestSourceFile
		let storageName:String? = nil
		let versionId:String? = nil
		
		uploadFile(name: path, folder: "") {
			StorageAPI.objectExists(path: path, storageName: storageName, versionId: versionId)
			{
				(response, error) in
				guard error == nil else {
					XCTFail("error testobjectExists")
					return
				}
	
				if let response = response {
                    XCTAssertTrue(response.exists)
                    XCTAssertFalse(response.isFolder)
					expectation.fulfill()
				}
			}
		}
		self.waitForExpectations(timeout: testTimeout, handler: nil)		
	}

	func teststorageExists() 
	{
		let expectation = self.expectation(description: "teststorageExists")
		let storageName:String = "First Storage"

        StorageAPI.storageExists(storageName: storageName)
        {
            (response, error) in
            guard error == nil else {
                XCTFail("error teststorageExists")
                return
            }

            if let response = response {
                XCTAssertTrue(response.exists)
                expectation.fulfill()
            }
        }
		self.waitForExpectations(timeout: testTimeout, handler: nil)		
	}

	func testuploadFile() 
	{
		let expectation = self.expectation(description: "testuploadFile")
		let path:String = LocalTestSourceFile
		let file:URL? = getURL(path)
		let storageName:String? = nil
		
        StorageAPI.uploadFile(path: path, file: file!, storageName: storageName)
        {
            (response, error) in
            guard error == nil else {
                XCTFail("error testuploadFile")
                return
            }

            if let response = response {
                XCTAssertTrue(response.uploaded!.count > 0)
                expectation.fulfill()
            }
        }
		self.waitForExpectations(timeout: testTimeout, handler: nil)		
	}

}