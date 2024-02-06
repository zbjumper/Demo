//
//  SwingDemoBundle.swift
//  SwingDemo
//
//  Created by 张博 on 2024/2/6.
//

import WidgetKit
import SwiftUI

@main
struct SwingDemoBundle: WidgetBundle {
    var body: some Widget {
        SwingDemo()
        SwingDemoLiveActivity()
    }
}
