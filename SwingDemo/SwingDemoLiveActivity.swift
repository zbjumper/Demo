//
//  SwingDemoLiveActivity.swift
//  SwingDemo
//
//  Created by 张博 on 2024/2/6.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct SwingDemoAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct SwingDemoLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: SwingDemoAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension SwingDemoAttributes {
    fileprivate static var preview: SwingDemoAttributes {
        SwingDemoAttributes(name: "World")
    }
}

extension SwingDemoAttributes.ContentState {
    fileprivate static var smiley: SwingDemoAttributes.ContentState {
        SwingDemoAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: SwingDemoAttributes.ContentState {
         SwingDemoAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: SwingDemoAttributes.preview) {
   SwingDemoLiveActivity()
} contentStates: {
    SwingDemoAttributes.ContentState.smiley
    SwingDemoAttributes.ContentState.starEyes
}
