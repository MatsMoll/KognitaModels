import Foundation

extension TypingTask {
    public struct Submit: Codable {
        public let timeUsed: TimeInterval?
        public let knowledge: Double
        public let taskIndex: Int
        public let answer: String
    }
}
