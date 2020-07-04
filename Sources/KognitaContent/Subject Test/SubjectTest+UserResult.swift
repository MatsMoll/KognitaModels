extension SubjectTest {
    public struct UserResult: Codable {
        public init(userEmail: String, score: Double, percentage: Double) {
            self.userEmail = userEmail
            self.score = score
            self.percentage = percentage
        }

        public let userEmail: String
        public let score: Double
        public let percentage: Double
    }
}
