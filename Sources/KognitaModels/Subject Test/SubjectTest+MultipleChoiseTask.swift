import Foundation

extension SubjectTest {

    public struct MultipleChoiceTask: Task, Codable {

        public init(test: SubjectTest, id: Int, subtopicID: Subtopic.ID, description: String? = nil, question: String, creatorID: User.ID? = nil, examType: ExamTaskType? = nil, examYear: Int? = nil, isTestable: Bool, createdAt: Date? = nil, updatedAt: Date? = nil, editedTaskID: Int? = nil, isMultipleSelect: Bool, choises: [SubjectTest.MultipleChoiceTask.Choise], tasks: [SubjectTest.AssignedTask]) {
            self.test = test
            self.id = id
            self.subtopicID = subtopicID
            self.description = description
            self.question = question
            self.creatorID = creatorID
            self.examType = examType
            self.examYear = examYear
            self.isTestable = isTestable
            self.createdAt = createdAt
            self.updatedAt = updatedAt
            self.editedTaskID = editedTaskID
            self.isMultipleSelect = isMultipleSelect
            self.choises = choises
            self.tasks = tasks
        }

        public struct Choise: Codable {
            public init(id: Int, choise: String, isCorrect: Bool, isSelected: Bool) {
                self.id = id
                self.choise = choise
                self.isCorrect = isCorrect
                self.isSelected = isSelected
            }

            public let id: Int
            public let choise: String
            public let isCorrect: Bool
            public let isSelected: Bool
        }

        public let test: SubjectTest

        public var id: Int
        public var subtopicID: Subtopic.ID
        public var description: String?
        public var question: String
        public var creatorID: User.ID?
        public var examType: ExamTaskType?
        public var examYear: Int?
        public var isTestable: Bool
        public var createdAt: Date?
        public var updatedAt: Date?
        public var editedTaskID: Int?
        public let isMultipleSelect: Bool
        public let choises: [Choise]

        public let tasks: [AssignedTask]
    }
}
