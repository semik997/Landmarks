//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Sem Koliesnikov on 07/02/2023.
//

import SwiftUI

struct LandmarkDetail: View {
    
    @EnvironmentObject var modelData: ModelData
    var landMark: LandMark
    
    var landMarkIndex: Int {
        modelData.landMarks.firstIndex (where: { $0.id == landMark.id })!
    }
    
    var body: some View {
        ScrollView {
            MapView(coordinate: landMark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 400)
            
            CircleImage(image: landMark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                
                HStack {
                    Text(landMark.name)
                        .font(.title)
                    FavoriteButton(isSet: $modelData.landMarks[landMarkIndex].isFavorite)
                }
                
                HStack {
                    Text(landMark.park)
                    Spacer()
                    Text(landMark.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text("About \(landMark.name)")
                    .font(.title2)
                Text(landMark.description)
            }
            .padding()
        }
        .navigationTitle(landMark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landMark: ModelData().landMarks[0])
    }
}
