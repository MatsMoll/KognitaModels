public struct Subject: Codable, Identifiable {

    public let id: Int
    public let name: String
    public let description: String
    public let category: String

    public init(id: Subject.ID, name: String, description: String, category: String) {
        self.id = id
        self.name = name
        self.description = description
        self.category = category
    }
}

extension Subject {
    public struct Compendium: Codable {

        public init(subjectID: Subject.ID, subjectName: String, topics: [Subject.Compendium.TopicData]) {
            self.subjectID = subjectID
            self.subjectName = subjectName
            self.topics = topics
        }

        public struct QuestionData: Codable {

            public init(question: String, solution: String) {
                self.question = question
                self.solution = solution
            }

            public let question: String
            public let solution: String
        }

        public struct SubtopicData: Codable {

            public init(subjectID: Subject.ID, subtopicID: Subtopic.ID, name: String, questions: [Subject.Compendium.QuestionData]) {
                self.subjectID = subjectID
                self.subtopicID = subtopicID
                self.name = name
                self.questions = questions
            }

            public let subjectID: Subject.ID
            public let subtopicID: Subtopic.ID
            public let name: String
            public let questions: [QuestionData]
        }

        public struct TopicData: Codable {

            public init(name: String, chapter: Int, subtopics: [Subject.Compendium.SubtopicData]) {
                self.name = name
                self.chapter = chapter
                self.subtopics = subtopics
            }

            public let name: String
            public let chapter: Int
            public let subtopics: [SubtopicData]
        }

        public let subjectID: Subject.ID
        public let subjectName: String
        public let topics: [TopicData]
    }
}
