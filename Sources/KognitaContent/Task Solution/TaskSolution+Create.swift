extension TaskSolution {
    public enum Create {
        public struct Data: Codable {
            public init(solution: String, presentUser: Bool, taskID: Int) {
                self.solution = solution
                self.presentUser = presentUser
                self.taskID = taskID
            }

            public let solution: String
            public let presentUser: Bool
            public let taskID: Task.ID
        }

        public typealias Response = NoData
    }

    public enum Update {
        public struct Data: Codable {
            public let solution: String?
            public let presentUser: Bool?

            public init(solution: String?, presentUser: Bool?) {
                self.solution = solution
                self.presentUser = presentUser
            }
        }

        public typealias Response = NoData
    }
}
