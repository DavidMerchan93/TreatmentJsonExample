//
//  JsonWidget.swift
//  JsonWidget
//
//  Created by David Merchan on 30/12/24.
//

import WidgetKit
import SwiftUI

// Modelo
struct SimpleEntry: TimelineEntry {
    let date: Date
    let emoji: String
}

// Provider
struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), emoji: "😀")
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), emoji: "😀")
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, emoji: "😀")
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

// Diseño
struct JsonWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            Text("Emoji:")
            Text(entry.emoji)
        }
    }
}

// Configuracion
struct JsonWidget: Widget {
    //identificador del widget
    let kind: String = "JsonWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            JsonWidgetEntryView(entry: entry)
                .padding()
                .background()
        }
        .configurationDisplayName("My Widget") // Nombre del widget
        .description("This is an example widget.") // Detalle del widget
    }
}

#Preview(as: .systemSmall) {
    JsonWidget()
} timeline: {
    SimpleEntry(date: .now, emoji: "😀")
    SimpleEntry(date: .now, emoji: "🤩")
}
