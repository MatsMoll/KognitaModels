extension MultipleChoiceTaskChoice {

    public enum Create {
        public struct Data: Codable {
            public init(choice: String, isCorrect: Bool) {
                self.choice = choice
                self.isCorrect = isCorrect
            }

            public let choice: String
            public let isCorrect: Bool
        }
    }
}
