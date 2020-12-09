extension TestSession {
    
    /// The data that is presented before a user is submitting the test
    public struct PreSubmitOverview: Codable {
        
        /// Inits the struct
        /// - Parameters:
        ///   - sessionID: The session id
        ///   - test: The test
        ///   - tasks: The tasks in the test
        public init(sessionID: TestSession.ID, test: SubjectTest, tasks: [TestSession.PreSubmitOverview.TaskStatus]) {
            self.sessionID = sessionID
            self.test = test
            self.tasks = tasks
        }
        
        /// The session ID
        public let sessionID: TestSession.ID
        
        /// The subject Test
        public let test: SubjectTest
        
        /// The tasks in the test
        public let tasks: [TaskStatus]
        
        /// The status for each task
        public struct TaskStatus: Codable {

            public init(testTaskID: Int, question: String, isAnswered: Bool) {
                self.testTaskID = testTaskID
                self.question = question
                self.isAnswered = isAnswered
            }
            
            /// The id of the test task
            public let testTaskID: Int
            
            /// The question answered
            public let question: String
            
            /// If the question is answered
            public let isAnswered: Bool
        }
    }
}
