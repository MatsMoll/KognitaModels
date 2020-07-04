import Foundation

extension PracticeSession {
    public struct Overview: Codable {

        public let id: ID
        public let createdAt: Date
        public let endedAt: Date
        public let subjectName: String
        public let subjectID: Subject.ID

        public init(id: PracticeSession.ID, createdAt: Date, endedAt: Date, subjectName: String, subjectID: Subject.ID) {
            self.id = id
            self.createdAt = createdAt
            self.endedAt = endedAt
            self.subjectName = subjectName
            self.subjectID = subjectID
        }
    }
}
