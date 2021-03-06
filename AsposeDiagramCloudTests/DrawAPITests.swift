//
// DrawAPITests.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import XCTest
@testable import AsposeDiagramCloud


class DrawAPITests: AsposeDiagramCloudTests {
    
    internal static var OneTimeFlag = false
    
	override func setUp() 
	{
		super.setUp()
		// Put setup code here. This method is called before the invocation of each test method in the class.
        if (DrawAPITests.OneTimeFlag)
        {
            return
        }
        let expectation = self.expectation(description: "DrawAPITestsSetUp")
        let name:String = File_TEST_DRAWING
        let folder:String? = StorageTestFOLDER
        let isOverwrite:Bool? = true
        AuthAspose.checkAuth()
            {
                (authError) in
                guard authError == nil else {
                    XCTFail("error DrawAPITestsSetUp")
                    return
                }
                
                DiagramAPI.createNew(name: name, folder: folder, isOverwrite: isOverwrite)
                {
                    (response, error) in
                    guard error == nil else {
                        XCTFail("error DrawAPITestsSetUp-createNew")
                        return
                    }
                    
                    if let response = response {
                        XCTAssertTrue(response.created != nil)
                        print("DrawAPITestsSetUp-createNew OK: " + response.created!)
                        DrawAPITests.OneTimeFlag = true
                        expectation.fulfill()
                    }
                }
        }
        self.waitForExpectations(timeout: testTimeout, handler: nil)
	}
	
	override func tearDown() 
	{
		// Put teardown code here. This method is called after the invocation of each test method in the class.
		super.tearDown()
	}

	func testputDrawEllipse() 
	{
		let expectation = self.expectation(description: "testputDrawEllipse")
		let name:String = File_TEST_DRAWING
		let pageName:String = Test_Page_Name
        let shapeStyleData: ShapeStyleData = ShapeStyleData(backGroundColor: "#FF0000")
        let textStyleData: TextStyleData = TextStyleData(color: nil, style: TextStyleData.Style.Bold, fontName: "Times New Roman", fontSize: 0.25)
		let ellipseData:EllipseData = EllipseData(pinX: 5, pinY: 5, width: 1, height: 1, shapeStyleData: shapeStyleData, text: "test draw ellipse", textStyleData: textStyleData)
		let folder:String? = StorageTestFOLDER
		
        DiagramAPI.putDrawEllipse(name: name, pageName: pageName, ellipseData: ellipseData, folder: folder)
        {
            (response, error) in
            guard error == nil else {
                XCTFail("error testputDrawEllipse")
                return
            }

            if let response = response {
                XCTAssertTrue(response.isSuccess)
                expectation.fulfill()
            }
        }
		self.waitForExpectations(timeout: testTimeout, handler: nil)		
	}

	func testputDrawLine() 
	{
		let expectation = self.expectation(description: "testputDrawLine")
		let name:String = File_TEST_DRAWING
		let pageName:String = Test_Page_Name
        let shapeStyleData: ShapeStyleData = ShapeStyleData(backGroundColor: "#FF0000")
        let textStyleData: TextStyleData = TextStyleData(color: nil, style: TextStyleData.Style.Italic, fontName: "Times New Roman", fontSize: 0.25)
        let points: [PointF] = [PointF(isEmpty: false, X: 0, Y: 0), PointF(isEmpty: false, X: 0, Y: 1)]
		let lineData:LineData = LineData(pinX: 1, pinY: 2, width: 1, height: 1, shapeStyleData: shapeStyleData, text: "test draw line", textStyleData: textStyleData, points: points)
		let folder:String? = StorageTestFOLDER
		
        DiagramAPI.putDrawLine(name: name, pageName: pageName, lineData: lineData, folder: folder)
        {
            (response, error) in
            guard error == nil else {
                XCTFail("error testputDrawLine")
                return
            }

            if let response = response {
                XCTAssertTrue(response.isSuccess)
                expectation.fulfill()
            }
        }
		self.waitForExpectations(timeout: testTimeout, handler: nil)		
	}

	func testputDrawPolyline() 
	{
		let expectation = self.expectation(description: "testputDrawPolyline")
		let name:String = File_TEST_DRAWING
		let pageName:String = Test_Page_Name
        let shapeStyleData: ShapeStyleData = ShapeStyleData(backGroundColor: "#FF0000")
        let textStyleData: TextStyleData = TextStyleData(color: nil, style: TextStyleData.Style.Italic, fontName: "Times New Roman", fontSize: 0.25)
        let points: [PointF] = [PointF(isEmpty: false, X: 0, Y: 0), PointF(isEmpty: false, X: 0, Y: 1), PointF(isEmpty: false, X: 1, Y: 1), PointF(isEmpty: false, X: 1, Y: 0)]
		let polylineData:PolylineData = PolylineData(pinX: 3, pinY: 3, width: 1, height: 1, shapeStyleData: shapeStyleData, text: "test draw polyline", textStyleData: textStyleData, points: points)
		let folder:String? = StorageTestFOLDER
		
        DiagramAPI.putDrawPolyline(name: name, pageName: pageName, polylineData: polylineData, folder: folder)
        {
            (response, error) in
            guard error == nil else {
                XCTFail("error testputDrawPolyline")
                return
            }

            if let response = response {
                XCTAssertTrue(response.isSuccess)
                expectation.fulfill()
            }
        }
		self.waitForExpectations(timeout: testTimeout, handler: nil)		
	}

}
