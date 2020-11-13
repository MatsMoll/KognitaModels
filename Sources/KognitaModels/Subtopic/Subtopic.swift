import Foundation

public struct Subtopic: Codable, Identifiable {
    
    /// The id of the subtopic
    public let id: Int
    
    /// The name of the subtopic
    public let name: String
    
    /// The id of the topic the subtopic is assosiated with
    public let topicID: Topic.ID

    public init(id: ID, name: String, topicID: Topic.ID) {
        self.id = id
        self.name = name
        self.topicID = topicID
    }
}
