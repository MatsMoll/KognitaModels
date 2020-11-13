import Foundation

/// The most basic information representing a `TypingTask`
public struct TypingTask: Task, Identifiable, Codable {
    public init(id: Int, subtopicID: Subtopic.ID, description: String? = nil, question: String, creatorID: User.ID? = nil, exam: Exam.Compact? = nil, isTestable: Bool, createdAt: Date? = nil, updatedAt: Date? = nil, deletedAt: Date?, editedTaskID: Int? = nil) {
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
}

extension TypingTask {

    /// A answer given for a `TypingTask`
    public struct Answer: Codable {
        public init(answer: String) {
            self.answer = answer
        }

        /// The answer
        public var answer: String
    }
}

extension TypingTask {

    /// A more detailed representation of a `TypingTask`
    /// Basicly meaning it also contains the different solutions
    public struct Details: Task, Codable, Identifiable {
        public init(id: Int, subtopicID: Subtopic.ID, description: String?, question: String, creatorID: User.ID?, exam: Exam.Compact?, isTestable: Bool, createdAt: Date?, updatedAt: Date?, deletedAt: Date?, editedTaskID: Int?, solutions: [TaskSolution]) {
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
            self.solutions = solutions
        }

        public let id: Int
        public let subtopicID: Subtopic.ID
        public let description: String?
        public let question: String
        public let creatorID: User.ID?
        public let exam: Exam.Compact?
        public let isTestable: Bool
        public let createdAt: Date?
        public let updatedAt: Date?
        public let deletedAt: Date?
        public let editedTaskID: Int?

        /// The solutions for a given task
        public let solutions: [TaskSolution]
    }

    public struct ModifyContent {
        public let task: TaskModifyContent?
        public let subject: Subject
        public var topics: [Topic.WithSubtopics]
        public let exams: [Exam]

        public init(subject: Subject, topics: [Topic.WithSubtopics], exams: [Exam], task: TaskModifyContent? = nil) {
            self.task = task
            self.subject = subject
            self.exams = exams
            self.topics = topics
        }

//        public init(subject: Subject.Overview) {
//            self.task = nil
//            self.subject = subject
//        }
    }
}
