//
// PageSize.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct PageSize: Codable {

    public enum PaperSizeFormat: String, Codable { 
        case RAWCUSTOM_ENUMCUSTOM = "'{raw=Custom, enum=Custom}'"
        case RAWA0_ENUMA0 = "'{raw=A0, enum=A0}'"
        case RAWA1_ENUMA1 = "'{raw=A1, enum=A1}'"
        case RAWA2_ENUMA2 = "'{raw=A2, enum=A2}'"
        case RAWA3_ENUMA3 = "'{raw=A3, enum=A3}'"
        case RAWA4_ENUMA4 = "'{raw=A4, enum=A4}'"
        case RAWA5_ENUMA5 = "'{raw=A5, enum=A5}'"
        case RAWA6_ENUMA6 = "'{raw=A6, enum=A6}'"
        case RAWA7_ENUMA7 = "'{raw=A7, enum=A7}'"
        case RAWB0_ENUMB0 = "'{raw=B0, enum=B0}'"
        case RAWB1_ENUMB1 = "'{raw=B1, enum=B1}'"
        case RAWB2_ENUMB2 = "'{raw=B2, enum=B2}'"
        case RAWB3_ENUMB3 = "'{raw=B3, enum=B3}'"
        case RAWB4_ENUMB4 = "'{raw=B4, enum=B4}'"
        case RAWB5_ENUMB5 = "'{raw=B5, enum=B5}'"
        case RAWB6_ENUMB6 = "'{raw=B6, enum=B6}'"
        case RAWB7_ENUMB7 = "'{raw=B7, enum=B7}'"
        case RAWC0_ENUMC0 = "'{raw=C0, enum=C0}'"
        case RAWC1_ENUMC1 = "'{raw=C1, enum=C1}'"
        case RAWC2_ENUMC2 = "'{raw=C2, enum=C2}'"
        case RAWC3_ENUMC3 = "'{raw=C3, enum=C3}'"
        case RAWC4_ENUMC4 = "'{raw=C4, enum=C4}'"
        case RAWC5_ENUMC5 = "'{raw=C5, enum=C5}'"
        case RAWC6_ENUMC6 = "'{raw=C6, enum=C6}'"
        case RAWC7_ENUMC7 = "'{raw=C7, enum=C7}'"
        case RAWLETTER_ENUMLETTER = "'{raw=Letter, enum=Letter}'"
        case RAWLEGAL_ENUMLEGAL = "'{raw=Legal, enum=Legal}'"
        case RAWLEGAL13_ENUMLEGAL13 = "'{raw=Legal13, enum=Legal13}'"
        case RAWTABLOID_ENUMTABLOID = "'{raw=Tabloid, enum=Tabloid}'"
        case RAWEXECUTIVE_ENUMEXECUTIVE = "'{raw=Executive, enum=Executive}'"
        case RAWDL_ENUMDL = "'{raw=DL, enum=Dl}'"
        case RAWCOM9_ENUMCOM9 = "'{raw=COM9, enum=Com9}'"
        case RAWCOM10_ENUMCOM10 = "'{raw=COM10, enum=Com10}'"
        case RAWMONARCH_ENUMMONARCH = "'{raw=Monarch, enum=Monarch}'"
    }
    public var paperSizeFormat: PaperSizeFormat?

public enum CodingKeys: String, CodingKey { 
        case paperSizeFormat = "PaperSizeFormat"
    }

    public init(paperSizeFormat: PaperSizeFormat?) {
        self.paperSizeFormat = paperSizeFormat
    }


}

