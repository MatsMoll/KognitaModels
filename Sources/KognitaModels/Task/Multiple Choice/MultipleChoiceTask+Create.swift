extension MultipleChoiceTask {

    public struct Create {

        public struct Data: Codable {

            public init(subtopicId: Topic.ID, description: String?, question: String, solution: String, isMultipleSelect: Bool, examPaperSemester: ExamTaskType?, examPaperYear: Int?, isTestable: Bool, choises: [MultipleChoiceTaskChoice.Create.Data]) {
                self.subtopicId = subtopicId
                self.description = description
                self.question = question
                self.solution = solution
                self.isMultipleSelect = isMultipleSelect
                self.examPaperSemester = examPaperSemester
                self.examPaperYear = examPaperYear
                self.isTestable = isTestable
                self.choises = choises
            }

            public let subtopicId: Topic.ID
            public let description: String?
            public let question: String
            public let solution: String
            public let isMultipleSelect: Bool
            public let examPaperSemester: ExamTaskType?
            public let examPaperYear: Int?
            public let isTestable: Bool
            public let choises: [MultipleChoiceTaskChoice.Create.Data]
        }

        public typealias Response = MultipleChoiceTask
    }
}
