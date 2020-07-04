import Foundation

extension TypingTask {
    public struct Submit: Codable {
        public init(timeUsed: TimeInterval?, knowledge: Double, taskIndex: Int, answer: String) {
            self.timeUsed = timeUsed
            self.knowledge = knowledge
            self.taskIndex = taskIndex
            self.answer = answer
        }

        public let timeUsed: TimeInterval?
        public let knowledge: Double
        public let taskIndex: Int
        public let answer: String
    }
}
