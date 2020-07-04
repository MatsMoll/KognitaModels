import Foundation

public struct MultipleChoiceTask: Task, Codable {

    public init(id: Int, subtopicID: Subtopic.ID, description: String? = nil, question: String, creatorID: User.ID? = nil, examType: ExamTaskType? = nil, examYear: Int? = nil, isTestable: Bool, createdAt: Date? = nil, updatedAt: Date? = nil, editedTaskID: Int? = nil, isMultipleSelect: Bool, choises: [MultipleChoiceTaskChoice]) {
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
    }

    public init(task: Task, isMultipleSelect: Bool, choices: [MultipleChoiceTaskChoice]) {
        self.init(
            id: task.id,
            subtopicID: task.subtopicID,
            description: task.description,
            question: task.question,
            creatorID: task.creatorID,
            examType: task.examType,
            examYear: task.examYear,
            isTestable: task.isTestable,
            createdAt: task.createdAt,
            updatedAt: task.updatedAt,
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
    public var examType: ExamTaskType?
    public var examYear: Int?
    public var isTestable: Bool
    public var createdAt: Date?
    public var updatedAt: Date?
    public var editedTaskID: Int?
    public let isMultipleSelect: Bool
    public let choises: [MultipleChoiceTaskChoice]
}


extension MultipleChoiceTask {

    public struct ModifyContent {
        public let task: TaskModifyContent?
        public let subject: Subject
        public var topics: [Topic.WithSubtopics] { [] }

        public let isMultipleSelect: Bool
        public let choises: [MultipleChoiceTaskChoice]

        public init(task: TaskModifyContent?, subject: Subject, multiple: MultipleChoiceTask?, choises: [MultipleChoiceTaskChoice]) {
            self.task = task
            self.subject = subject
//            self.topics = topics
            self.isMultipleSelect = multiple?.isMultipleSelect ?? false
            self.choises = choises
        }

        public init(subject: Subject, topics: [Topic]) {
            self.task = nil
            self.isMultipleSelect = false
            self.choises = []
            self.subject = subject
//            self.topics = topics
        }
    }
}
