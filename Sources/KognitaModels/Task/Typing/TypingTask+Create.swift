extension TypingTask {

    public struct Create: Codable {
        
        /// The data needed to create a typing task
        public struct Data: Codable {
            
            /// The subtopic id represented with the task
            public let subtopicId: Subtopic.ID
            
            /// The description in for the task if any
            public let description: String?
            
            /// The question to answer
            public let question: String
            
            /// A solution
            public let solution: String
            
            /// If it can be used in a test
            public let isTestable: Bool
            
            /// The id of the exam the task is assosiated with
            public let examID: Exam.ID?
            
            /// The resources assosiated with the task
            public let resources: [Resource.Create]

            public init(subtopicId: Subtopic.ID, description: String?, question: String, solution: String, isTestable: Bool, examID: Exam.ID? = nil, resources: [Resource.Create]) {
                self.subtopicId = subtopicId
                self.description = description
                self.question = question
                self.solution = solution
                self.isTestable = isTestable
                self.examID = examID
                self.resources = resources
            }
        }

        public typealias Response = TypingTask
    }
}
