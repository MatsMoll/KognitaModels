extension Sessions {
    public struct Result: Codable {
        public init(subject: Subject, results: [Sessions.TaskResult]) {
            self.subject = subject
            self.results = results
        }

        public let subject: Subject
        public let results: [Sessions.TaskResult]
    }
}
