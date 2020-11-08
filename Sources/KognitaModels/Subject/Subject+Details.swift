extension Subject {
    public struct Details: Codable {

        public let subject: Subject
        public let topics: [Topic.UserOverview]
        public let subjectLevel: Subject.UserLevel
        public let openTest: SubjectTest.UserOverview?
        public let numberOfTasks: Int
        public let isActive: Bool
        public let canPractice: Bool
        public let isModerator: Bool
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
