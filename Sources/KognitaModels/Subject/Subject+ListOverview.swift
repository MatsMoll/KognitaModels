extension Subject {

    /// The `Subject` info presented when listing subjects to a user
    public struct ListOverview: Codable {
        
        public struct SearchQuery: Codable {
            public let name: String?
            
            public init(name: String? = nil) {
                self.name = name
            }
        }

        public let id: Subject.ID
        public let name: String
        public let description: String
        public let category: String
        public let isActive: Bool

        public init(id: Subject.ID, name: String, description: String, category: String, isActive: Bool) {
            self.id = id
            self.name = name
            self.description = description
            self.category = category
            self.isActive = isActive
        }
    }
}

extension Subject {
    public struct Overview: Codable {

        public init(id: Int, name: String, description: String, category: String, topics: [Topic]) {
            self.id = id
            self.name = name
            self.description = description
            self.category = category
            self.topics = topics
        }

        public let id: Int
        public let name: String
        public let description: String
        public let category: String

        public let topics: [Topic]
    }
}
