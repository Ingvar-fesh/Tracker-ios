import UIKit

struct TrackerCategory {
    let label: String
    let trackers: [Tracker]
    
    init(label: String, trackers: [Tracker]) {
        self.label = label
        self.trackers = trackers
    }
}

extension TrackerCategory {
    static let sampleData: [TrackerCategory] = [
        TrackerCategory(
            label: "Домашний уют",
            trackers: [
//                Tracker(
//                    label: "Поливать растения",
//                    emoji: "❤️",
//                    color: UIColor(named: "Color selection 5")!,
//                    schedule: [.saturday]
//                )
            ]
        ),
        TrackerCategory(
            label: "Радостные мелочи",
            trackers: [
//                Tracker(
//                    label: "Кошка заслонила камеру на созвоне",
//                    emoji: "😻",
//                    color: UIColor(named: "Color selection 2")!,
//                    schedule: nil
//                ),
//                Tracker(
//                    label: "Бабушка прислала открытку в вотсапе",
//                    emoji: "🌺",
//                    color: UIColor(named: "Color selection 1")!,
//                    schedule: nil
//                ),
//                Tracker(
//                    label: "Свидания в апреле",
//                    emoji: "❤️",
//                    color: UIColor(named: "Color selection 14")!,
//                    schedule: nil
//                ),
            ]
        )
    ]
}
