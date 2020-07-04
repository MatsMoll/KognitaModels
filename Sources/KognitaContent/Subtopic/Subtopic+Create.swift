extension Subtopic {

    public enum Create {

        public struct Data: Codable {

            public let name: String

            public var topicId: Topic.ID

            public init(name: String, topicId: Topic.ID) {
                self.name = name
                self.topicId = topicId
            }
        }

        public typealias Response = Subtopic
    }
}
