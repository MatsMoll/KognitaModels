extension TypingTask {

    public struct Create: Codable {

        public struct Data: Codable {

            public let subtopicId: Subtopic.ID

            public let description: String?

            public let question: String

            public let solution: String

            public let isTestable: Bool

            public let examID: Exam.ID?

            public init(subtopicId: Subtopic.ID, description: String?, question: String, solution: String, isTestable: Bool, examID: Exam.ID? = nil) {
                self.subtopicId = subtopicId
                self.description = description
                self.question = question
                self.solution = solution
                self.isTestable = isTestable
                self.examID = examID
            }
        }

        public typealias Response = TypingTask
    }
}
