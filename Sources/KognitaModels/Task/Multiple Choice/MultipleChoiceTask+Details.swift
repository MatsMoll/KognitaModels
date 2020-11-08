import Foundation

extension MultipleChoiceTask {

    public struct Details: Task, Codable, Identifiable {

        public init(id: Int, subtopicID: Subtopic.ID, description: String?, question: String, creatorID: User.ID?, exam: Exam.Compact?, isTestable: Bool, isDraft: Bool, createdAt: Date?, updatedAt: Date?, deletedAt: Date?, editedTaskID: Int? = nil, isMultipleSelect: Bool, choices: [MultipleChoiceTaskChoice], solutions: [TaskSolution]) {
            self.id = id
            self.subtopicID = subtopicID
            self.description = description
            self.question = question
            self.creatorID = creatorID
            self.exam = exam
            self.isTestable = isTestable
            self.isDraft = isDraft
            self.createdAt = createdAt
            self.updatedAt = updatedAt
            self.deletedAt = deletedAt
            self.editedTaskID = editedTaskID
            self.isMultipleSelect = isMultipleSelect
            self.choices = choices
            self.solutions = solutions
        }

        public var id: Int
        public var subtopicID: Subtopic.ID
        public var description: String?
        public var question: String
        public var creatorID: User.ID?
        public var exam: Exam.Compact?
        public var isTestable: Bool
        public var isDraft: Bool
        public var createdAt: Date?
        public var updatedAt: Date?
        public var deletedAt: Date?
        public var editedTaskID: Int?
        public let isMultipleSelect: Bool
        public let choices: [MultipleChoiceTaskChoice]

        public let solutions: [TaskSolution]
    }
}
