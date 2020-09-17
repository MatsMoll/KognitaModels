extension TypingTask {

    public struct Create: Codable {

        public struct Data: Codable {

            public let subtopicId: Subtopic.ID

            public let description: String?

            public let question: String

            public let solution: String

            public var isTestable: Bool

            public var examPaperSemester: ExamTaskType?

            public var examPaperYear: Int?

            public init(subtopicId: Subtopic.ID, description: String?, question: String, solution: String, isTestable: Bool, examPaperSemester: ExamTaskType? = nil, examPaperYear: Int? = nil) {
                self.subtopicId = subtopicId
                self.description = description
                self.question = question
                self.solution = solution
                self.isTestable = isTestable
                self.examPaperSemester = examPaperSemester
                self.examPaperYear = examPaperYear
            }
        }

        public typealias Response = TypingTask

        public struct Draft: Codable {

            public let subtopicID: Subtopic.ID

            public let description: String?

            public let question: String

            public let solution: String?

            public init(subtopicID: Subtopic.ID, description: String?, question: String, solution: String?) {
                self.subtopicID = subtopicID
                self.description = description
                self.question = question
                self.solution = solution
            }
        }
    }
}
