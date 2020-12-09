import Foundation

extension MultipleChoiceTask {
    
    /// The details for a miltiple choice tasks
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
        
        /// The id of the task
        public var id: Int
        
        /// The id of the subtopic
        public var subtopicID: Subtopic.ID
        
        /// The descirption
        public var description: String?
        
        /// The question to answer
        public var question: String
        
        /// The user who created the task
        public var creatorID: User.ID?
        
        /// The exam content
        public var exam: Exam.Compact?
        
        /// If it is used on tests
        public var isTestable: Bool
        
        public var isDraft: Bool
        
        /// When it was created
        public var createdAt: Date?
        
        /// When it was updated
        public var updatedAt: Date?
        
        /// When it was tombstoned
        public var deletedAt: Date?
        
        /// The id of the edited task
        public var editedTaskID: Int?
        
        /// If it is possible to select mutliple chocies
        public let isMultipleSelect: Bool
        
        /// The different chocies to select
        public let choices: [MultipleChoiceTaskChoice]
        
        /// The different solutions to the task
        public let solutions: [TaskSolution]
    }
}
