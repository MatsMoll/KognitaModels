extension Subject {

    /// The `Subject` info presented when listing subjects to a user
    public struct ListOverview: Codable {

        public struct SearchQuery: Codable {
            public let name: String?

            public init(name: String? = nil) {
                self.name = name
            }
        }
        
        /// The id assosiated with the subject
        public let id: Subject.ID
        
        /// The name of the subject
        public let name: String
        
        /// The description of the subject
        public let description: String
        
        /// The category of the subject
        public let category: String
        
        /// If the subject is marked as active for the user
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
    /// An overview over the subject
    public struct Overview: Codable {

        public init(id: Int, name: String, description: String, category: String, topics: [Topic]) {
            self.id = id
            self.name = name
            self.description = description
            self.category = category
            self.topics = topics
        }
        
        /// The id of the subject
        public let id: Int
        
        /// The name of the subject
        public let name: String
        
        /// The description of the subject
        public let description: String
        
        /// The category of the subject
        public let category: String
        
        /// The topics in the subject
        public let topics: [Topic]
    }
}
