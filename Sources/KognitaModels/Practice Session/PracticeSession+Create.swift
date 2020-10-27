extension PracticeSession {

    public enum Create {

        public struct Data: Decodable {

            /// The number of task to complete in a session
            public let numberOfTaskGoal: Int

            /// The topic id's for the tasks to map
            public let subtopicsIDs: Set<Subtopic.ID>?

            public let topicIDs: Set<Topic.ID>?
            
            public let useTypingTasks: Bool
            
            public let useMultipleChoiceTasks: Bool

            public init(numberOfTaskGoal: Int, subtopicsIDs: Set<Subtopic.ID>?, topicIDs: Set<Topic.ID>?, useTypingTasks: Bool, useMultipleChoiceTasks: Bool) {
                self.numberOfTaskGoal = numberOfTaskGoal
                self.subtopicsIDs = subtopicsIDs
                self.topicIDs = topicIDs
                self.useTypingTasks = useTypingTasks
                self.useMultipleChoiceTasks = useMultipleChoiceTasks
            }
        }

        public typealias Response = PracticeSession
    }
}
