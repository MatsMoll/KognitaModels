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

public protocol Task {

    typealias ID = Int

    var id: Int { get }

    /// The topic.id for the topic this task relates to
    var subtopicID: Subtopic.ID { get }

    /// Some markdown that contains extra information about the task if needed
    var description: String? { get }

    /// The question needed to answer the task
    var question: String { get }

    /// The id of the user who created the task
    var creatorID: User.ID? { get }

    /// The semester of the exam
    var examType: ExamTaskType? { get }

    /// The year of the exam
    var examYear: Int? { get }

    /// If the task can be used for testing
    var isTestable: Bool { get }

    /// The date the task was created at
    var createdAt: Date? { get }

    /// The date the task was updated at
    /// - Note: Usually a task will be marked as isOutdated and create a new `Task` when updated
    var updatedAt: Date? { get }

    /// The id of the new edited task if there exists one
    var editedTaskID: Task.ID? { get }
}

public struct GenericTask: Codable, Task, Identifiable {

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

    public init(id: Int, subtopicID: Subtopic.ID, description: String? = nil, question: String, creatorID: User.ID? = nil, examType: ExamTaskType? = nil, examYear: Int? = nil, isTestable: Bool, createdAt: Date? = nil, updatedAt: Date? = nil, editedTaskID: Int? = nil) {
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
    }
}


public struct CreatorTaskContent {
    
    public init(task: Task, topic: Topic, creator: User, isMultipleChoise: Bool) {
        self.task = task
        self.topic = topic
        self.creator = creator
        self.isMultipleChoise = isMultipleChoise
    }

    public let task: Task
    public let topic: Topic
    public let creator: User
    public let isMultipleChoise: Bool

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

    public var examType: ExamTaskType? { nil }

    public var examYear: Int? { nil }

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

    public let solution: String

    public let deletedAt: Date?

    public var isDeleted: Bool { deletedAt != nil }

    init(task: Task, solution: String) {
        self.id = task.id
        self.subtopicID = task.subtopicID
        self.description = task.description
        self.question = task.question
        self.isTestable = task.isTestable
        self.editedTaskID = task.editedTaskID
        self.solution = solution
        self.creatorID = task.creatorID
        self.deletedAt = nil
    }
}
