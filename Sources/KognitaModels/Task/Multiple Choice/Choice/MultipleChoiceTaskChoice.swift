public struct MultipleChoiceTaskChoice: Codable {
    
    public init(id: MultipleChoiceTaskChoice.ID, choice: String, isCorrect: Bool) {
        self.id = id
        self.choice = choice
        self.isCorrect = isCorrect
    }


    public typealias ID = Int

    public let id: MultipleChoiceTaskChoice.ID

    public let choice: String

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

        public let id: MultipleChoiceTaskChoice.ID

        public let choice: String

        public let wasSelected: Bool

        public let isCorrect: Bool

        public var wasCorrect: Bool { wasSelected == isCorrect }

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

    public struct Result: Codable {

        public init(id: MultipleChoiceTaskChoice.ID, isCorrect: Bool) {
            self.id = id
            self.isCorrect = isCorrect
        }

        public let id: MultipleChoiceTaskChoice.ID

        public let isCorrect: Bool
    }
}
