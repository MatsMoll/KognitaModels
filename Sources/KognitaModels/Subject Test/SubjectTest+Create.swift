import Foundation

extension SubjectTest {
    public enum Create {
        public struct Data: Codable {
            public init(tasks: [Int], subjectID: Subject.ID, duration: TimeInterval, scheduledAt: Date, password: String, title: String, isTeamBasedLearning: Bool) {
                self.tasks = tasks
                self.subjectID = subjectID
                self.duration = duration
                self.scheduledAt = scheduledAt
                self.password = password
                self.title = title
                self.isTeamBasedLearning = isTeamBasedLearning
            }

            public let tasks: [Int]
            public let subjectID: Subject.ID
            public let duration: TimeInterval
            public let scheduledAt: Date
            public let password: String
            public let title: String
            public let isTeamBasedLearning: Bool
        }

        public typealias Response = SubjectTest
    }
}
