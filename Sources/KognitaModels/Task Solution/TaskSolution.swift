import Foundation

/// Representing the most basic information of a solution for a `Task`
public struct TaskSolution: Codable, Identifiable {

    /// The id of the solution
    public let id: Int

    /// The task id of the solution is assosiated wiht
    public let taskID: Task.ID

    /// When it was created
    public let createdAt: Date

    /// The actuall solution
    public let solution: String

    /// The id of the user who created it
    public var creatorID: User.ID

    /// The id of the user who approved the solution
    /// This can be nil if it has not been approved yet
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
    
    public struct Import: Codable {

        /// The actuall solution
        public let solution: String

        public init(solution: String) {
            self.solution = solution
        }
    }
}

extension TaskSolution {

    /// A more GUI friendly representation of a solution
    public struct Response: Codable {

        /// The ID of the solution
        public let id: TaskSolution.ID

        /// When it was created
        public let createdAt: Date

        /// The acctual solution
        public let solution: String

        /// The id of the user who created the solution
        public var creatorID: User.ID

        /// The creators username
        public var creatorUsername: String

        /// If the creator should be presented
        public let presentUser: Bool

        /// The username of the user that approved the solution
        public let approvedBy: String?

        /// The number of votes the solution contains
        public let numberOfVotes: Int

        /// If the current user has voted on the solution
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

    /// A representatino of a unverified solution
    public struct Unverified: Codable {

        public init(taskID: Int, solutionID: TaskSolution.ID, description: String?, question: String, solution: String, choises: [MultipleChoiceTaskChoice]) {
            self.taskID = taskID
            self.solutionID = solutionID
            self.description = description
            self.question = question
            self.solution = solution
            self.choises = choises
        }

        /// The task id that the solution is assosiated with
        public let taskID: Task.ID

        /// The id of the solution
        public let solutionID: TaskSolution.ID

        /// The description of the task
        public let description: String?

        /// The question the solution is answering
        public let question: String

        /// The actuall solution
        public let solution: String

        /// The different choices if it is a multiple multiple choice task
        public let choises: [MultipleChoiceTaskChoice]
    }
}


extension TaskSolution {
    
    public struct Resources: Codable {
        
        public init(solutions: [TaskSolution.Response], resources: [Resource]) {
            self.solutions = solutions
            self.resources = resources
        }
        
        public let solutions: [TaskSolution.Response]
        public let resources: [Resource]
    }
}
