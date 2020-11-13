import Foundation

/// The semester a exam was taken
public enum ExamTaskType: String, Codable {
    case original
    case postponed

    public var norwegianDescription: String {
        switch self {
        case .original:     return "Original"
        case .postponed:    return "Utsatt"
        }
    }
}

/// A protocol defining the information needed in order to be a task
public protocol Task {

    typealias ID = Int

    /// The id of the task
    var id: ID { get }

    /// The topic.id for the topic this task relates to
    var subtopicID: Subtopic.ID { get }

    /// Some markdown that contains extra information about the task if needed
    var description: String? { get }

    /// The question needed to answer the task
    var question: String { get }

    /// The id of the user who created the task
    var creatorID: User.ID? { get }

    /// The semester of the exam
    var exam: Exam.Compact? { get }

    /// If the task can be used for testing
    var isTestable: Bool { get }

    /// The date the task was created at
    var createdAt: Date? { get }

    /// The date the task was updated at
    /// - Note: Usually a task will be marked as isOutdated and create a new `Task` when updated
    var updatedAt: Date? { get }

    /// The date the task was deleted
    var deletedAt: Date? { get }

    /// The id of the new edited task if there exists one
    var editedTaskID: Task.ID? { get }
}

public struct GenericTask: Codable, Task, Identifiable {

    public var id: Int

    public var subtopicID: Subtopic.ID

    public var description: String?

    public var question: String

    public var creatorID: User.ID?

    public var exam: Exam.Compact?

    public var isTestable: Bool

    public var createdAt: Date?

    public var updatedAt: Date?

    public var deletedAt: Date?

    public var editedTaskID: Int?

    public init(id: Int, subtopicID: Subtopic.ID, description: String? = nil, question: String, creatorID: User.ID? = nil, exam: Exam.Compact? = nil, isTestable: Bool, createdAt: Date? = nil, updatedAt: Date? = nil, editedTaskID: Int? = nil, deletedAt: Date?) {
        self.id = id
        self.subtopicID = subtopicID
        self.description = description
        self.question = question
        self.creatorID = creatorID
        self.exam = exam
        self.isTestable = isTestable
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.editedTaskID = editedTaskID
        self.deletedAt = deletedAt
    }
}

public struct CreatorTaskContent: Codable {

    public init(task: GenericTask, topic: Topic, creator: User, isMultipleChoise: Bool) {
        self.task = task
        self.topic = topic
        self.creator = creator
        self.isMultipleChoise = isMultipleChoise
    }

    public let task: GenericTask
    public let topic: Topic
    public let creator: User
    public let isMultipleChoise: Bool
    public var isNote: Bool = false

    public var taskTypePath: String {
        if isMultipleChoise {
            return "tasks/multiple-choise"
        } else {
            return "tasks/flash-card"
        }
    }
}

public struct TaskPreviewContent {

    public init(subject: Subject, topic: Topic, task: Task, actionDescription: String) {
        self.subject = subject
        self.topic = topic
        self.task = task
        self.actionDescription = actionDescription
    }

    public let subject: Subject
    public let topic: Topic
    public let task: Task
    public let actionDescription: String
}

public struct TaskModifyContent: Codable, Task, Identifiable {

    public var exam: Exam.Compact?

    public var createdAt: Date? { nil }

    public var updatedAt: Date? { nil }

    public let id: Int

    public let creatorID: User.ID?

    /// The topic.id for the topic this task relates to
    public let subtopicID: Subtopic.ID

    /// Some html that contains extra information about the task if needed
    public let description: String?

    /// The question needed to answer the task
    public let question: String

    /// If the task can be used for testing
    public let isTestable: Bool

    /// The id of the new edited task if there exists one
    public let editedTaskID: Task.ID?

    public let solutions: [TaskSolution]

    public let deletedAt: Date?

    public var isDeleted: Bool { deletedAt != nil }

    public init(task: Task, solutions: [TaskSolution]) {
        self.id = task.id
        self.exam = task.exam
        self.subtopicID = task.subtopicID
        self.description = task.description
        self.question = task.question
        self.isTestable = task.isTestable
        self.editedTaskID = task.editedTaskID
        self.solutions = solutions
        self.creatorID = task.creatorID
        self.deletedAt = task.deletedAt
    }
}

public struct TaskOverviewQuery: Codable {
    public let taskQuestion: String?
    public let topics: [Topic.ID]

    public init(taskQuestion: String?, topics: [Topic.ID]) {
        self.taskQuestion = taskQuestion
        self.topics = topics
    }
}
