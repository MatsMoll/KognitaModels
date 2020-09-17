public struct Topic: Codable, Identifiable {

    public let id: Int
    public let subjectID: Subject.ID
    public let name: String
    public let chapter: Int

    public init(id: Int, subjectID: Subject.ID, name: String, chapter: Int) {
        self.id = id
        self.subjectID = subjectID
        self.name = name
        self.chapter = chapter
    }
}

extension Topic {
    public struct WithSubtopics: Codable {
        
        public init(name: String, subtopics: [Subtopic]) {
            self.name = name
            self.subtopics = subtopics
        }

        public let name: String
        public let subtopics: [Subtopic]
    }
}
