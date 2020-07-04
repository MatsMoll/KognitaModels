extension TaskDiscussion {

    public enum Create {

        public struct Data: Codable {
            public let description: String
            public let taskID: Int

            public init(description: String, taskID: Int) {
                self.description = description
                self.taskID = taskID
            }
        }

        public typealias Response = NoData
    }
}
