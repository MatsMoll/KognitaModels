public struct Topic: Codable, Identifiable {

    /// The id of the topic
    public let id: Int

    /// The `Subject` id that the topic is under
    public let subjectID: Subject.ID

    /// The name of the topic
    public let name: String

    /// The chapter
    public let chapter: Int

    public init(id: Int, subjectID: Subject.ID, name: String, chapter: Int) {
        self.id = id
        self.subjectID = subjectID
        self.name = name
        self.chapter = chapter
    }
}

extension Topic {
    /// A representation of a topic that contains the different subtopics
    public struct WithSubtopics: Codable {

        public init(name: String, subtopics: [Subtopic]) {
            self.name = name
            self.subtopics = subtopics
        }

        /// The name of the topic
        public let name: String

        /// The subtopics in the topic
        public let subtopics: [Subtopic]
    }
}
