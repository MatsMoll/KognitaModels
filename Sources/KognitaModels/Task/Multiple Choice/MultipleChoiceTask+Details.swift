import Foundation

extension MultipleChoiceTask {

    public struct Details: Task {

        public init(id: Int, subtopicID: Subtopic.ID, description: String? = nil, question: String, creatorID: User.ID? = nil, examType: ExamTaskType? = nil, examYear: Int? = nil, isTestable: Bool, isDraft: Bool, createdAt: Date? = nil, updatedAt: Date? = nil, deletedAt: Date?, editedTaskID: Int? = nil, isMultipleSelect: Bool, choises: [MultipleChoiceTaskChoice], solutions: [TaskSolution]) {
            self.id = id
            self.subtopicID = subtopicID
            self.description = description
            self.question = question
            self.creatorID = creatorID
            self.examType = examType
            self.examYear = examYear
            self.isTestable = isTestable
            self.isDraft = isDraft
            self.createdAt = createdAt
            self.updatedAt = updatedAt
            self.deletedAt = deletedAt
            self.editedTaskID = editedTaskID
            self.isMultipleSelect = isMultipleSelect
            self.choises = choises
            self.solutions = solutions
        }

        public var id: Int
        public var subtopicID: Subtopic.ID
        public var description: String?
        public var question: String
        public var creatorID: User.ID?
        public var examType: ExamTaskType?
        public var examYear: Int?
        public var isTestable: Bool
        public var isDraft: Bool
        public var createdAt: Date?
        public var updatedAt: Date?
        public var deletedAt: Date?
        public var editedTaskID: Int?
        public let isMultipleSelect: Bool
        public let choises: [MultipleChoiceTaskChoice]

        public let solutions: [TaskSolution]
    }
}
