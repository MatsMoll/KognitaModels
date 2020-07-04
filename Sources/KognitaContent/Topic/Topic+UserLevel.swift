extension Topic {
    public struct UserLevel: Codable {

        public init(topicID: Topic.ID, correctScore: Double, maxScore: Double) {
            self.topicID = topicID
            self.correctScore = correctScore
            self.maxScore = maxScore
        }

        public let topicID: Topic.ID
        public let correctScore: Double
        public let maxScore: Double

        public var correctScoreInteger: Int { return Int(correctScore.rounded()) }
        public var correctProsentage: Double {
            return (correctScore * 1000 / maxScore).rounded() / 10
        }
    }
}
