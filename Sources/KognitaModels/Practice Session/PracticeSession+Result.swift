extension Sessions {
    public struct Result: Codable {
        public init(subject: Subject, results: [Sessions.TaskResult], resources: [Resource]) {
            self.subject = subject
            self.results = results
            self.resources = resources
        }

        public let subject: Subject
        public let results: [Sessions.TaskResult]
        public let resources: [Resource]
    }
}
