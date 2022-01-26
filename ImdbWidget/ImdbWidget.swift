//
//  ImdbWidget.swift
//  ImdbWidget
//
//  Created by Emrah Atalay on 17.01.2022.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent(), firstName: "İnek Şaban", lastName: "Kemal Sunal")
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {

        let entry = SimpleEntry(date: Date(), configuration: configuration, firstName: "İnek Şaban", lastName: "Kemal Sunal")
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        let currentDate = Date()

        for timeOffset in 1 ..< 100 {
            let entryDate = Calendar.current.date(byAdding: .second, value: timeOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration, firstName: "Hababam Sınıfı \(timeOffset)", lastName: "Kemal Sunal")
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
    let firstName: String
    let lastName: String
}

struct ImdbWidgetEntryView: View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            Text("Haftanın Filmi")
                .bold()
                .underline()
                .foregroundColor(.blue)
                .padding()

            Text(entry.firstName)
                .bold()
                .foregroundColor(.orange)
                .font(.title3)

            Text(entry.lastName)
                .bold()
                .foregroundColor(.gray)
                .font(.body)
        }
    }
}

@main
struct ImdbWidget: Widget {
    let kind: String = "ImdbWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            ImdbWidgetEntryView(entry: entry)
        }
            .configurationDisplayName("My Widget")
            .description("This is an example widget.")
    }
}

struct ImdbWidget_Previews: PreviewProvider {
    static var previews: some View {
        ImdbWidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent(), firstName: "İnek Şaban", lastName: "Kemal Sunal"))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
