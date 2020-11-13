/// Representing a choice on a multiple choice task
public struct MultipleChoiceTaskChoice: Codable, Identifiable {

    public init(id: MultipleChoiceTaskChoice.ID, choice: String, isCorrect: Bool) {
        self.id = id
        self.choice = choice
        self.isCorrect = isCorrect
    }

    /// The id of the choice
    public let id: Int

    /// The chocie
    public let choice: String

    /// If it is correct
    public let isCorrect: Bool
}

extension MultipleChoiceTaskChoice {

    public struct Answered: Codable {

        public init(id: MultipleChoiceTaskChoice.ID, choice: String, wasSelected: Bool, isCorrect: Bool) {
            self.id = id
            self.choice = choice
            self.wasSelected = wasSelected
            self.isCorrect = isCorrect
        }

        /// The id of the choice
        public let id: MultipleChoiceTaskChoice.ID

        /// The choice
        public let choice: String

        /// If it was selected
        public let wasSelected: Bool

        /// If it is correct or not
        public let isCorrect: Bool

        /// If it was the correct chocie by the user
        public var wasCorrect: Bool { wasSelected == isCorrect }

        /// The same infromation represented as a `MultipleChoiceTaskChoice`
        public var multipleChoiceTaskChoice: MultipleChoiceTaskChoice {
            MultipleChoiceTaskChoice(
                id: id,
                choice: choice,
                isCorrect: isCorrect
            )
        }
    }
}

extension MultipleChoiceTaskChoice {

    /// The result of an chosen choice
    public struct Result: Codable {

        public init(id: MultipleChoiceTaskChoice.ID, isCorrect: Bool) {
            self.id = id
            self.isCorrect = isCorrect
        }

        /// The id of the choice
        public let id: MultipleChoiceTaskChoice.ID

        /// If it was the correct choice
        public let isCorrect: Bool
    }
}
