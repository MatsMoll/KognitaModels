extension Subject {

    public enum Create {

        /// The data needed to create a `Subject`
        public struct Data: Codable {
            public init(name: String, description: String, category: String) {
                self.name = name
                self.description = description
                self.category = category
            }

            /// The name of the subject
            public let name: String

            /// The description og the subject
            public let description: String

            /// THe category of the subject
            public let category: String
        }

        public typealias Response = Subject
    }
}
