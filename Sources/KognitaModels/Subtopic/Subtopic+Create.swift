extension Subtopic {

    public enum Create {
        
        /// The data needed to create a subtopic
        public struct Data: Codable {
            
            /// The name of the subtopic
            public let name: String
            
            /// The id of the topic
            public var topicID: Topic.ID

            public init(name: String, topicId: Topic.ID) {
                self.name = name
                self.topicID = topicId
            }
        }

        public typealias Response = Subtopic
    }
}
