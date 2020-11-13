import Foundation

/// A test session representation
public struct TestSession: Codable, Identifiable {
    public init(id: Int, createdAt: Date, submittedAt: Date? = nil, testID: SubjectTest.ID) {
        self.id = id
        self.createdAt = createdAt
        self.submittedAt = submittedAt
        self.testID = testID
    }

    /// The id of the session
    public var id: Int

    /// The date and time of when it was created
    public var createdAt: Date

    /// The date and time of when the test was submitted
    /// In order to get the final results
    public var submittedAt: Date?

    /// The test id of the test the users is taking
    public var testID: SubjectTest.ID

    /// If the user has submitted their answers
    public var hasSubmitted: Bool { submittedAt != nil }
}

extension TestSession {
    public struct CompletedOverview: Codable, Identifiable {
        public let id: TestSession.ID
        public let subjectName: String
        public let subjectID: Subject.ID
        public let endedAt: Date
        public let createdAt: Date
        public let testTitle: String
    }
}
