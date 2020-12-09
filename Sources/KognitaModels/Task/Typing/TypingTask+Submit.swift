import Foundation

extension TypingTask {
    
    /// The data needed to submit an answer to a typing task
    public struct Submit: Codable {
        public init(timeUsed: TimeInterval?, knowledge: Double, taskIndex: Int, answer: String) {
            self.timeUsed = timeUsed
            self.knowledge = knowledge
            self.taskIndex = taskIndex
            self.answer = answer
        }
        
        /// The time used to answer
        public let timeUsed: TimeInterval?
        
        /// The score
        public let knowledge: Double
        
        /// The task index
        public let taskIndex: Int
        
        /// The submitted answer
        public let answer: String
    }
}
