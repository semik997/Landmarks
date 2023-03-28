//
//  ModelData.swift
//  Landmarks
//
//  Created by Sem Koliesnikov on 07/02/2023.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var landMarks: [LandMark] = load("landmarkData.json")
    var hikes: [Hike] = load("hikeData.json")
}

func load<T: Decodable>(_ fileName: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: fileName, withExtension: nil)
    else {
        fatalError("Couldn't find \(fileName) in main bundle")
    }
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(fileName) in main bundle: \(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(fileName) as \(T.self): \(error)")
    }
}
