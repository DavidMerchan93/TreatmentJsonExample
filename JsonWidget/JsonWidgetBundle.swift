//
//  JsonWidgetBundle.swift
//  JsonWidget
//
//  Created by David Merchan on 30/12/24.
//

import WidgetKit
import SwiftUI

@main
struct JsonWidgetBundle: WidgetBundle {
    var body: some Widget {
        JsonWidget()
        JsonWidgetControl()
        JsonWidgetLiveActivity()
    }
}
