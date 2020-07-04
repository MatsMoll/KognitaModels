extension TestSession {
    public struct PreSubmitOverview: Codable {

        public init(sessionID: TestSession.ID, test: SubjectTest, tasks: [TestSession.PreSubmitOverview.TaskStatus]) {
            self.sessionID = sessionID
            self.test = test
            self.tasks = tasks
        }

        public let sessionID: TestSession.ID
        public let test: SubjectTest
        public let tasks: [TaskStatus]

        public struct TaskStatus: Codable {

            public init(testTaskID: Int, question: String, isAnswered: Bool) {
                self.testTaskID = testTaskID
                self.question = question
                self.isAnswered = isAnswered
            }

            public let testTaskID: Int
            public let question: String
            public let isAnswered: Bool
        }
    }
}
