extension Subject {
    
    /// Details describing a subject
    public struct Details: Codable {
        
        /// The subject information
        public let subject: Subject
        
        /// The topics in the subject
        public let topics: [Topic.UserOverview]
        
        /// The subject level
        public let subjectLevel: Subject.UserLevel
        
        /// A open test in the subject if any
        public let openTest: SubjectTest.UserOverview?
        
        /// The number of tasks in the subject
        public let numberOfTasks: Int
        
        /// If it is activ
        public let isActive: Bool
        
        /// If the user can practice in the subject
        public let canPractice: Bool
        
        /// If the user is a moderator in the subject
        public let isModerator: Bool
        
        /// All the exams assosiated with the subject
        public let exams: [Exam.WithCompletion]

        public init(subject: Subject, topics: [Topic.UserOverview], openTest: SubjectTest.UserOverview?, numberOfTasks: Int, isActive: Bool, canPractice: Bool, isModerator: Bool, exams: [Exam.WithCompletion]) {
            self.subject = subject
            self.topics = topics
            self.subjectLevel = Subject.UserLevel(
                subjectID: subject.id,
                correctScore: topics.reduce(0) { $0 + $1.userLevel.correctScore },
                maxScore: topics.reduce(0) { $0 + $1.userLevel.maxScore }
            )
            self.openTest = openTest
            self.numberOfTasks = numberOfTasks
            self.isActive = isActive
            self.canPractice = canPractice
            self.isModerator = isModerator
            self.exams = exams
        }
    }
}
