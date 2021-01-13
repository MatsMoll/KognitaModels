/// Representing a Subject like "Introduction to AI"
public struct Subject: Codable, Identifiable {
    
    /// The id of the subject
    public let id: Int
    
    /// A code identifying the subject
    public let code: String
    
    /// The name of the subject
    public let name: String
    
    /// The description of the subject
    public let description: String
    
    /// The category of the subject
    /// Eg. Technology, Design etc.
    public let category: String

    public init(id: Subject.ID, code: String, name: String, description: String, category: String) {
        self.id = id
        self.code = code
        self.name = name
        self.description = description
        self.category = category
    }
}

extension Subject {
    
    /// The data representating the compendum
    public struct Compendium: Codable {

        public init(subjectID: Subject.ID, subjectName: String, topics: [Subject.Compendium.TopicData]) {
            self.subjectID = subjectID
            self.subjectName = subjectName
            self.topics = topics
        }
        
        /// Representation of the question data
        public struct QuestionData: Codable {

            public init(question: String, solution: String) {
                self.question = question
                self.solution = solution
            }
            
            /// The question
            public let question: String
            
            /// The solution for the question
            public let solution: String
        }
        
        /// The subtopic data
        public struct SubtopicData: Codable {

            public init(subjectID: Subject.ID, subtopicID: Subtopic.ID, name: String, questions: [Subject.Compendium.QuestionData], terms: [Term.Compact]) {
                self.subjectID = subjectID
                self.subtopicID = subtopicID
                self.name = name
                self.questions = questions
                self.terms = terms
            }
            
            /// Teh subject id
            public let subjectID: Subject.ID
            
            /// The subtopic id
            public let subtopicID: Subtopic.ID
            
            /// The name of the subtopic
            public let name: String
            
            /// The question data assosiated with the subtopic
            public let questions: [QuestionData]
            
            public let terms: [Term.Compact]
        }
        
        /// The topic data
        public struct TopicData: Codable {

            public init(name: String, chapter: Int, subtopics: [Subject.Compendium.SubtopicData]) {
                self.name = name
                self.chapter = chapter
                self.subtopics = subtopics
            }
            
            /// The name of the topic
            public let name: String
            
            /// The chapter of the topic
            public let chapter: Int
            
            /// The subtopic data assosiated with the topic
            public let subtopics: [SubtopicData]
        }
        
        /// The subject id
        public let subjectID: Subject.ID
        
        /// The subject name
        public let subjectName: String
        
        /// The topic data assosiated with the `Subject`
        public let topics: [TopicData]
    }
}
