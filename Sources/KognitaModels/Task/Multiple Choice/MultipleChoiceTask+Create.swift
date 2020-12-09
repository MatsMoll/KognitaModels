extension MultipleChoiceTask {

    public struct Create {
        
        /// The data needed to create a multiple choice task
        public struct Data: Codable {

            public init(subtopicId: Topic.ID, description: String?, question: String, solution: String, isMultipleSelect: Bool, examID: Exam.ID?, isTestable: Bool, choises: [MultipleChoiceTaskChoice.Create.Data]) {
                self.subtopicId = subtopicId
                self.description = description
                self.question = question
                self.solution = solution
                self.isMultipleSelect = isMultipleSelect
                self.examID = examID
                self.isTestable = isTestable
                self.choises = choises
            }
            
            /// The subtopic id
            public let subtopicId: Topic.ID
            
            /// The description if needed
            public let description: String?
            
            /// The question to answer
            public let question: String
            
            /// A solutino explaying the differnet chocies
            public let solution: String
            
            /// If it is possible to select multiple choices
            public let isMultipleSelect: Bool
            
            /// The id of the exam the task is assosiated with
            public let examID: Exam.ID?
            
            /// If the task can be used on tests
            public let isTestable: Bool
            
            /// The different choices in the task
            public let choises: [MultipleChoiceTaskChoice.Create.Data]
        }

        public typealias Response = MultipleChoiceTask
    }
}
