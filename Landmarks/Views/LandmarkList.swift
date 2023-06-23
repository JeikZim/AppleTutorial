//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Руслан on 23.06.2023.
//  Copyright © 2023 Apple. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        NavigationView {
            List(landmarks) {landmark in
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

#if DEBUG
struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
#endif
