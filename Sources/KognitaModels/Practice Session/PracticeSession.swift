import Foundation

public struct PracticeSession: Codable {

    public typealias ID = Int

    public let id: ID
    public let numberOfTaskGoal: Int
    public let createdAt: Date
    public let endedAt: Date?

    public init(id: PracticeSession.ID, numberOfTaskGoal: Int, createdAt: Date, endedAt: Date?) {
        self.id = id
        self.numberOfTaskGoal = numberOfTaskGoal
        self.createdAt = createdAt
        self.endedAt = endedAt
    }
}

public enum Sessions {

    public typealias ID = Int

    public struct HistoryList: Codable {

        public let testSessions: [TestSession.CompletedOverview]
        public let practiceSessions: [PracticeSession.Overview]

        public init(testSessions: [TestSession.CompletedOverview], practiceSessions: [PracticeSession.Overview]) {
            self.testSessions = testSessions
            self.practiceSessions = practiceSessions
        }
    }
}
