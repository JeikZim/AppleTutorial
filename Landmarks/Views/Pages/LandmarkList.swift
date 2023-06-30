//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Руслан on 23.06.2023.
//  Copyright © 2023 Apple. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject
    var modelData: ModelData
    
    @State
    private var showFavoritesOnly: Bool = false
    
    var filtredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(filtredLandmarks) {landmark in
                    NavigationLink(
                        destination: {
                            LandmarkDetails(landmark: landmark)
                        },
                        label: {
                            LandmarkRow(landmark: landmark)
                        }
                    )
                    
                }
                .navigationTitle("Landmarks")
            }
        }
    }
}

#if DEBUG
struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList().environmentObject(ModelData())
    }
}
#endif
