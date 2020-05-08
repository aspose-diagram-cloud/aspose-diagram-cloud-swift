//
// PolylineData.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public class PolylineData: DrawShapeData {

    public var points: [PointF]?

public enum CodingKeys: String, CodingKey {
        case points = "Points"
    }

    public init(pinX: Double, pinY: Double, width: Double, height: Double, shapeStyleData: ShapeStyleData?, text: String?, textStyleData: TextStyleData?, points: [PointF]?) {
        self.points = points
        super.init(pinX: pinX, pinY: pinY, width: width, height: height, shapeStyleData: shapeStyleData, text: text, textStyleData: textStyleData)
    }

    // Encodable protocol methods
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: String.self)
        
        try container.encodeIfPresent(points, forKey: "Points")
        
        try super.encode(to: encoder)
    }
    
    // Decodable protocol methods
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: String.self)
        
        points = try container.decodeIfPresent([PointF].self, forKey: "Points")
        
        try super.init(from: decoder)
    }

}

