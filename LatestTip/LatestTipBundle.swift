//
//  LatestTipBundle.swift
//  LatestTip
//
//  Created by Aiden on 3/24/23.
//

import WidgetKit
import SwiftUI

@main
struct LatestTipBundle: WidgetBundle {
    var body: some Widget {
        LatestTip()
        LatestTipLiveActivity()
    }
}
