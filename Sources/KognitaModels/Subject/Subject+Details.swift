extension Subject {
    public struct Details: Codable {

        public init(subject: Subject, topics: [Topic.UserOverview], subjectLevel: Subject.UserLevel, openTest: SubjectTest.UserOverview?, numberOfTasks: Int, isActive: Bool, canPractice: Bool, isModerator: Bool) {
            self.subject = subject
            self.topics = topics
            self.subjectLevel = subjectLevel
            self.openTest = openTest
            self.numberOfTasks = numberOfTasks
            self.isActive = isActive
            self.canPractice = canPractice
            self.isModerator = isModerator
        }

        public let subject: Subject
        public let topics: [Topic.UserOverview]
        public let subjectLevel: Subject.UserLevel
        public let openTest: SubjectTest.UserOverview?
        public let numberOfTasks: Int
        public let isActive: Bool
        public let canPractice: Bool
        public let isModerator: Bool
    }
}
