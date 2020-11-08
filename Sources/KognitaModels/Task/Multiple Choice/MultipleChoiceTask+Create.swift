extension MultipleChoiceTask {

    public struct Create {

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

            public let subtopicId: Topic.ID
            public let description: String?
            public let question: String
            public let solution: String
            public let isMultipleSelect: Bool
            public let examID: Exam.ID?
            public let isTestable: Bool
            public let choises: [MultipleChoiceTaskChoice.Create.Data]
        }

        public typealias Response = MultipleChoiceTask
    }
}
