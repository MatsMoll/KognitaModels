extension Topic {

    /// Data required to create a topic
    public enum Create {

        /// The data needed for creating a `Topic`
        public struct Data: Codable {

            /// This subject id
            public let subjectID: Subject.ID

            /// The name of the topic
            public let name: String

            /// The chapther number in a subject
            public let chapter: Int

            public init(subjectID: Subject.ID, name: String, chapter: Int) {
                self.subjectID = subjectID
                self.name = name
                self.chapter = chapter
            }
        }

        /// Data returned when creating
        public typealias Response = Topic
    }
}
