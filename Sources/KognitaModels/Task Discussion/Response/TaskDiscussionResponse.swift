import Foundation

public struct TaskDiscussionResponse: Codable {

    public let response: String
    public let createdAt: Date?
    public let username: String
    public let isNew: Bool

    public init(response: String, createdAt: Date?, username: String, isNew: Bool) {
        self.response = response
        self.createdAt = createdAt
        self.username = username
        self.isNew = isNew
    }
}
