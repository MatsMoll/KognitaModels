import Foundation

extension Sessions {
    public struct TaskResult: Codable {

        public var topicID: Topic.ID
        public var topicName: String
        public var taskIndex: Int
        public var question: String
        public var score: Double
        public var timeUsed: TimeInterval
        public var date: Date?
        public var revisitDate: Date?
        public var isSetManually: Bool

        public var resultScore: Double { score * 100 }
    }
}
