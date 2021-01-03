extension Subject {

    public enum Create {

        /// The data needed to create a `Subject`
        public struct Data: Codable {
            public init(code: String, name: String, description: String, category: String) {
                self.code = code
                self.name = name
                self.description = description
                self.category = category
            }
            
            /// A code that identifies the subject
            public let code: String

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
