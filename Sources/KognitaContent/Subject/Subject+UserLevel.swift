extension Subject {
    public struct UserLevel: Codable {

        public init(subjectID: Subject.ID, correctScore: Double, maxScore: Double) {
            self.subjectID = subjectID
            self.correctScore = correctScore
            self.maxScore = maxScore
        }

        public let subjectID: Subject.ID
        public let correctScore: Double
        public let maxScore: Double

        public var correctScoreInteger: Int { return Int(correctScore.rounded()) }
        public var correctProsentage: Double {
            guard maxScore.isNormal else { return 0 }
            return (correctScore * 1000 / maxScore).rounded() / 10
        }
    }
}
