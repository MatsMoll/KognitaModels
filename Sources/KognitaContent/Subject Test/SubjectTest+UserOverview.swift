import Foundation

extension SubjectTest {

    /// A personalized `SubjectTest` overview for a `User`
    public struct UserOverview: Codable {

        public let id: SubjectTest.ID
        public let subjectName: String
        public let subjectID: Subject.ID
        public let title: String
        public let createdAt: Date
        public let duration: TimeInterval
        public let endsAt: Date?
        public let scheduledAt: Date
        public let openedAt: Date?
        public let hasSubmitted: Bool
        public let testSessionID: TestSession.ID?

        public var isOpen: Bool {
            guard
                let openedAt = openedAt,
                let endsAt = endsAt
            else {
                return false
            }
            return openedAt.timeIntervalSinceNow < 0 && endsAt.timeIntervalSinceNow > 0
        }

        public init(id: SubjectTest.ID, subjectName: String, subjectID: Subject.ID, title: String, createdAt: Date, duration: TimeInterval, endsAt: Date?, scheduledAt: Date, openedAt: Date?, hasSubmitted: Bool, testSessionID: TestSession.ID?) {
            self.id = id
            self.subjectName = subjectName
            self.subjectID = subjectID
            self.title = title
            self.createdAt = createdAt
            self.duration = duration
            self.endsAt = endsAt
            self.scheduledAt = scheduledAt
            self.openedAt = openedAt
            self.hasSubmitted = hasSubmitted
            self.testSessionID = testSessionID
        }

        public init(test: SubjectTest, subjectName: String, subjectID: Subject.ID, hasSubmitted: Bool, testSessionID: TestSession.ID?) {
            self.id = test.id
            self.title = test.title
            self.createdAt = test.createdAt
            self.scheduledAt = test.scheduledAt
            self.duration = test.duration
            self.openedAt = test.openedAt
            self.subjectName = subjectName
            self.subjectID = subjectID
            self.endsAt = test.endedAt
            self.hasSubmitted = hasSubmitted
            self.testSessionID = testSessionID
        }
    }
}
