//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Sem Koliesnikov on 07/02/2023.
//

import SwiftUI

struct LandmarkRow: View {
    var landMark: LandMark
    
    var body: some View {
        HStack {
            landMark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landMark.name)
            
            Spacer()
            
            if landMark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkRow(landMark: ModelData().landMarks[0])
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
