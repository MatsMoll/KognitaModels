extension Subject {

    public enum Create {
        public struct Data: Codable {
            public init(name: String, description: String, category: String) {
                self.name = name
                self.description = description
                self.category = category
            }

            public let name: String
            public let description: String
            public let category: String
        }

        public typealias Response = Subject
    }
}
