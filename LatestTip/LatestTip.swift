//
//  LatestTip.swift
//  LatestTip
//
//  Created by Aiden on 3/24/23.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct LatestTipEntryView : View {
    var entry: Provider.Entry
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "dollarsign.circle.fill")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Latest Tip")
                    .font(.title2)
                    .fontWeight(.bold)
            }
            .padding(.bottom, 3.0)
            
            VStack {
                Text("3.00")
                    .font(.title)
            }
        }
    }
}

struct LatestTip: Widget {
    let kind: String = "LatestTip"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            LatestTipEntryView(entry: entry)
        }
        .configurationDisplayName("Latest Tip")
        .description("This is an example widget.")
    }
}

struct LatestTip_Previews: PreviewProvider {
    static var previews: some View {
        LatestTipEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
