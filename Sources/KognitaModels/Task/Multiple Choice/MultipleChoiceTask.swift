import Foundation

/// A representatino of a multiple choice task type
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

    /// Check the `Task` definition
    public var id: Int

    /// Check the `Task` definition
    public var subtopicID: Subtopic.ID

    /// Check the `Task` definition
    public var description: String?

    /// Check the `Task` definition
    public var question: String

    /// Check the `Task` definition
    public var creatorID: User.ID?

    /// Check the `Task` definition
    public var exam: Exam.Compact?

    /// Check the `Task` definition
    public var isTestable: Bool

    /// Check the `Task` definition
    public var createdAt: Date?

    /// Check the `Task` definition
    public var updatedAt: Date?

    /// Check the `Task` definition
    public var deletedAt: Date?

    /// Check the `Task` definition
    public var editedTaskID: Int?

    /// If the user can select more the one choice
    public let isMultipleSelect: Bool

    /// The different choices
    public let choises: [MultipleChoiceTaskChoice]
}

extension MultipleChoiceTask {
    
    /// The content that is needed to edit a task in a GUI
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
