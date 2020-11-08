import Foundation

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
}

extension TypingTask {
    public struct Answer: Codable {
        public init(answer: String) {
            self.answer = answer
        }

        public var answer: String
    }
}

extension TypingTask {
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
