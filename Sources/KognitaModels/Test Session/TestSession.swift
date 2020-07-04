import Foundation

public struct TestSession: Codable, Identifiable {
    public init(id: Int, createdAt: Date, submittedAt: Date? = nil, testID: SubjectTest.ID) {
        self.id = id
        self.createdAt = createdAt
        self.submittedAt = submittedAt
        self.testID = testID
    }


    public var id: Int
    public var createdAt: Date
    public var submittedAt: Date?
    public var testID: SubjectTest.ID
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
