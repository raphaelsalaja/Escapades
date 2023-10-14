//
//  SwiftUIView.swift
//  Escapades
//
//  Created by Raphael Salaja on 14/10/2023.
//

import SwiftUI
import WidgetKit

private struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> Void) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        let midnight = Calendar.current.startOfDay(for: Date())
        let nextMidnight = Calendar.current.date(byAdding: .day, value: 1, to: midnight)!
        let entries = [SimpleEntry(date: midnight)]
        let timeline = Timeline(entries: entries, policy: .after(nextMidnight))
        completion(timeline)
    }
}

private struct SimpleEntry: TimelineEntry {
    let date: Date
}

private struct EnvironmentWidgetEntryView: View {
    var entry: Provider.Entry

    @Environment(\.colorScheme) var colorScheme
    @Environment(\.widgetFamily) var widgetFamily

    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .containerBackground(.gray.quinary, for: .widget)
    }

    private var backgroundColor: Color {
        colorScheme == .dark ? .red : .orange
    }
}

struct EnvironmentWidget: Widget {
    private let kind: String = "screenshots"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: "screenshots", provider: Provider()) { entry in
            EnvironmentWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Environment Widget")
        .description("A demo showcasing how to adjust a Widget View depending on Environment variables.")
    }
}

#Preview(as: .systemLarge) {
    EnvironmentWidget()
} timeline: {
    SimpleEntry(date: .now)
}
