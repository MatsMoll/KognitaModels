import Foundation

public struct TypingTask: Task, Identifiable, Codable {
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
    public struct ModifyContent {
        public let task: TaskModifyContent?
        public let subject: Subject.Overview

        public init(subject: Subject.Overview) {
            self.task = nil
            self.subject = subject
        }

//        public init(subject: Subject.Overview) {
//            self.task = nil
//            self.subject = subject
//        }
    }
}
