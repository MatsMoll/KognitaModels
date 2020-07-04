extension PracticeSession {
    public struct Result: Codable {
        public init(subject: Subject, results: [PracticeSession.TaskResult]) {
            self.subject = subject
            self.results = results
        }

        public let subject: Subject
        public let results: [PracticeSession.TaskResult]
    }
}
