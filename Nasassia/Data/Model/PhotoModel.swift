//
//  PhotoModel.swift
//  Nasassia
//
//  Created by ONUR BOSTAN on 26.01.2024.
//

import Foundation

struct PhotoResponse : Codable{
    let photos : [PhotoModel]?
    
}
struct PhotoModel : Codable {
    let img_src : String
    let earth_date : String
    let rover : RoverModel
    let camera : CameraModel
}

struct RoverModel : Codable {
    let name : String
    let landing_date : String
    let launch_date : String
    let status : String
}

struct CameraModel : Codable {
    let name : String
    let full_name: String
}

enum Rover : String,Codable,CustomStringConvertible {
    var description: String {
        return self.rawValue
    }
    case Curiosity = "Curiosity"
    case Opportunity = "Opportunity"
    case Spirit = "Spirit"
}

enum NasaCamera : String,Codable,CustomStringConvertible {
    var description: String{
        return self.rawValue
    }
    case ALL = "ALL"
    case FHAZ = "FHAZ"
    case RHAZ = "RHAZ"
    case MAST = "MAST"
    case CHEMCAM = "CHEMCAM"
    case MAHLI = "MAHLI"
    case MARDI = "MARDI"
    case NAVCAM = "NAVCAM"
    case PANCAM = "PANCAM"
    case MINITES = "MINITES"
}
