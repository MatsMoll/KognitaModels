import Foundation

public struct Subtopic: Codable, Identifiable {

    public let id: Int
    public let name: String
    public let topicID: Topic.ID

    public init(id: ID, name: String, topicID: Topic.ID) {
        self.id = id
        self.name = name
        self.topicID = topicID
    }
}
