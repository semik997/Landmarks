//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Sem Koliesnikov on 07/02/2023.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ModelData())
        }
    }
}
