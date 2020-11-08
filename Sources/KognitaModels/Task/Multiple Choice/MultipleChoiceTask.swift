import Foundation

public struct MultipleChoiceTask: Task, Codable {

    public init(id: Int, subtopicID: Subtopic.ID, description: String? = nil, question: String, creatorID: User.ID? = nil, exam: Exam.Compact? = nil, isTestable: Bool, createdAt: Date? = nil, updatedAt: Date? = nil, deletedAt: Date?, editedTaskID: Int? = nil, isMultipleSelect: Bool, choises: [MultipleChoiceTaskChoice]) {
        self.id = id
        self.subtopicID = subtopicID
        self.description = description
        self.question = question
        self.creatorID = creatorID
        self.exam = exam
        self.isTestable = isTestable
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.deletedAt = deletedAt
        self.editedTaskID = editedTaskID
        self.isMultipleSelect = isMultipleSelect
        self.choises = choises
    }

    public init(task: Task, isMultipleSelect: Bool, choices: [MultipleChoiceTaskChoice]) {
        self.init(
            id: task.id,
            subtopicID: task.subtopicID,
            description: task.description,
            question: task.question,
            creatorID: task.creatorID,
            exam: task.exam,
            isTestable: task.isTestable,
            createdAt: task.createdAt,
            updatedAt: task.updatedAt,
            deletedAt: task.deletedAt,
            editedTaskID: task.editedTaskID,
            isMultipleSelect: isMultipleSelect,
            choises: choices
        )
    }

    public var id: Int
    public var subtopicID: Subtopic.ID
    public var description: String?
    public var question: String
    public var creatorID: User.ID?
    public var exam: Exam.Compact?
    public var isTestable: Bool
    public var isDraft: Bool = false
    public var createdAt: Date?
    public var updatedAt: Date?
    public var deletedAt: Date?
    public var editedTaskID: Int?
    public let isMultipleSelect: Bool
    public let choises: [MultipleChoiceTaskChoice]
}

extension MultipleChoiceTask {

    public struct ModifyContent {
        public let task: TaskModifyContent?
        public let subject: Subject
        public var topics: [Topic.WithSubtopics]
        public let exams: [Exam]

        public let isMultipleSelect: Bool
        public let choises: [MultipleChoiceTaskChoice]

        public init(task: TaskModifyContent?, subject: Subject, isMultipleSelect: Bool, choises: [MultipleChoiceTaskChoice], topics: [Topic.WithSubtopics], exams: [Exam]) {
            self.task = task
            self.subject = subject
            self.isMultipleSelect = isMultipleSelect
            self.choises = choises
            self.topics = topics
            self.exams = exams
        }

        public init(subject: Subject, topics: [Topic.WithSubtopics], exams: [Exam]) {
            self.task = nil
            self.isMultipleSelect = false
            self.choises = []
            self.subject = subject
            self.topics = topics
            self.exams = exams
        }
    }
}
