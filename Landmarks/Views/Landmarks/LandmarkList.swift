//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Sem Koliesnikov on 07/02/2023.
//

import SwiftUI

struct LandmarkList: View {
    
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    var filtredLandMarks: [LandMark] {
        modelData.landMarks.filter { landMark in
            (!showFavoritesOnly || landMark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorite Only")
                }
                ForEach(filtredLandMarks) { landMark in
                    
                    NavigationLink {
                        LandmarkDetail(landMark: landMark)
                    } label: {
                        LandmarkRow(landMark: landMark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
    }
}
