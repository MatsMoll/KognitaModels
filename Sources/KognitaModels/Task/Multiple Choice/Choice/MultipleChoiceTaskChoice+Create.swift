extension MultipleChoiceTaskChoice {

    public enum Create {

        /// The data needed to create a choice
        public struct Data: Codable {
            public init(choice: String, isCorrect: Bool) {
                self.choice = choice
                self.isCorrect = isCorrect
            }

            /// The choice
            public let choice: String

            /// If it is correct or not
            public let isCorrect: Bool
        }
    }
}
