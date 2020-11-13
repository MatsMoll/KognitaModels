extension Topic {

    /// Representing the compitanse or the user level in a `Topic`
    public struct UserLevel: Codable {

        public init(topicID: Topic.ID, correctScore: Double, maxScore: Double) {
            self.topicID = topicID
            self.correctScore = correctScore
            self.maxScore = maxScore
        }

        /// The topic ID of the topic it is representing
        public let topicID: Topic.ID

        /// The score the user has achived
        public let correctScore: Double

        /// The maximum score the user can achive
        public let maxScore: Double

        /// An integer representation of the `correctScore` variable
        public var correctScoreInteger: Int { return Int(correctScore.rounded()) }

        /// The percentage the user has achived
        public var correctProsentage: Double {
            return (correctScore * 1000 / maxScore).rounded() / 10
        }
    }
}
