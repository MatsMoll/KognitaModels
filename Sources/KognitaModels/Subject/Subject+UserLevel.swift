extension Subject {
    
    /// Describes the *skill level* for a user in a `Subject`
    public struct UserLevel: Codable {

        public init(subjectID: Subject.ID, correctScore: Double, maxScore: Double) {
            self.subjectID = subjectID
            self.correctScore = correctScore
            self.maxScore = maxScore
        }
        
        /// The id of the subject
        public let subjectID: Subject.ID
        
        /// The summed score in the subject
        public let correctScore: Double
        
        /// The maximum achiveable score
        public let maxScore: Double
        
        /// A more readable score value as an integer
        public var correctScoreInteger: Int { return Int(correctScore.rounded()) }
        
        /// The score as a percentage
        public var correctProsentage: Double {
            guard maxScore.isNormal else { return 0 }
            return (correctScore * 1000 / maxScore).rounded() / 10
        }
    }
}
