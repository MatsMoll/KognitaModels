
extension PracticeSession {

    public enum Create {

        public struct Data: Decodable {

            /// The number of task to complete in a session
            public let numberOfTaskGoal: Int

            /// The topic id's for the tasks to map
            public let subtopicsIDs: Set<Subtopic.ID>?

            public let topicIDs: Set<Topic.ID>?


            public init(numberOfTaskGoal: Int, subtopicsIDs: Set<Subtopic.ID>?, topicIDs: Set<Topic.ID>?) {
                self.numberOfTaskGoal = numberOfTaskGoal
                self.subtopicsIDs = subtopicsIDs
                self.topicIDs = topicIDs
            }
        }

        public typealias Response = PracticeSession
    }
}
