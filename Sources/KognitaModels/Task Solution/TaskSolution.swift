import Foundation

public struct TaskSolution: Codable, Identifiable {

    public let id: Int
    public let taskID: Task.ID
    public let createdAt: Date
    public let solution: String
    public var creatorID: User.ID
    public let approvedBy: User.ID?

    public init(id: Int, taskID: Int, createdAt: Date, solution: String, creatorID: User.ID, approvedBy: User.ID?) {
        self.id = id
        self.taskID = taskID
        self.createdAt = createdAt
        self.solution = solution
        self.creatorID = creatorID
        self.approvedBy = approvedBy
    }
}

extension TaskSolution {

    public struct Response: Codable {

        public let id: TaskSolution.ID
        public let createdAt: Date
        public let solution: String
        public var creatorID: User.ID
        public var creatorUsername: String
        public let presentUser: Bool
        public let approvedBy: String?
        public let numberOfVotes: Int
        public let userHasVoted: Bool

        public init(id: TaskSolution.ID, createdAt: Date, solution: String, creatorID: User.ID, creatorUsername: String, presentUser: Bool, approvedBy: String?, numberOfVotes: Int, userHasVoted: Bool) {
            self.id = id
            self.createdAt = createdAt
            self.solution = solution
            self.creatorID = creatorID
            self.creatorUsername = creatorUsername
            self.presentUser = presentUser
            self.approvedBy = approvedBy
            self.numberOfVotes = numberOfVotes
            self.userHasVoted = userHasVoted
        }
    }
}

extension TaskSolution {

    public struct Unverified: Codable {

        public init(taskID: Int, solutionID: TaskSolution.ID, description: String?, question: String, solution: String, choises: [MultipleChoiceTaskChoice]) {
            self.taskID = taskID
            self.solutionID = solutionID
            self.description = description
            self.question = question
            self.solution = solution
            self.choises = choises
        }

        public let taskID: Task.ID
        public let solutionID: TaskSolution.ID
        public let description: String?
        public let question: String
        public let solution: String

        public let choises: [MultipleChoiceTaskChoice]
    }
}
