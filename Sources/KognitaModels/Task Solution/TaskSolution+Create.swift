extension TaskSolution {
    public enum Create {

        /// The data needed to create a solution
        public struct Data: Codable {
            public init(solution: String, presentUser: Bool, taskID: Int) {
                self.solution = solution
                self.presentUser = presentUser
                self.taskID = taskID
            }

            /// The solution of the task
            public let solution: String

            /// If the user sould be presented or not
            public let presentUser: Bool

            /// The id of the task that the solution is assosiated with
            public let taskID: Task.ID
        }

        public typealias Response = NoData
    }

    public enum Update {

        /// The content needed to update a solution
        public struct Data: Codable {

            /// The updated solution if updating
            public let solution: String?

            /// If the user should be presented or not
            /// nil if not changing
            public let presentUser: Bool?

            public init(solution: String?, presentUser: Bool?) {
                self.solution = solution
                self.presentUser = presentUser
            }
        }

        public typealias Response = NoData
    }
}
