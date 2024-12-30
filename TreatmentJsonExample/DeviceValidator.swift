//
//  DeviceValidator.swift
//  TreatmentJsonExample
//
//  Created by David Merchan on 30/12/24.
//

import SwiftUI

struct DeviceValidator: View {
    
    let device = UIDevice.current.userInterfaceIdiom
    let deviceType = UIDevice.current.model.hasPrefix("iPad")
    
    var body: some View {
        if device == .pad && deviceType {
            Text("Estamos en un ipad")
        } else if device == .phone {
            Text("Estamos en un iphone")
        }
    }
}

#Preview {
    DeviceValidator()
}
