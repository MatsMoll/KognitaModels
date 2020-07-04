extension SubjectTest {
    public struct ScoreHistogram: Codable {

        public struct Score: Codable {
            public let score: Int
            public let amount: Int
            public let percentage: Double

            public init(score: Int, amount: Int, percentage: Double) {
                self.score = score
                self.amount = amount
                self.percentage = percentage
            }
        }

        public let scores: [Score]

        public init(scores: [Score]) {
            self.scores = scores
        }
    }
}

extension SubjectTest {

    @available(OSX 10.15.0, *)
    public struct MultipleChoiseTaskContent: Codable {

        public struct Choise: Codable {

            public let id: MultipleChoiceTaskChoice.ID
            public let choise: String
            public let isCorrect: Bool
            public let isSelected: Bool

            public init(id: MultipleChoiceTaskChoice.ID, choise: String, isCorrect: Bool, isSelected: Bool) {
                self.id = id
                self.choise = choise
                self.isCorrect = isCorrect
                self.isSelected = isSelected
            }
        }

        public let test: SubjectTest
        public let task: KognitaModels.MultipleChoiceTask
        public let choises: [Choise]

        public let testTasks: [AssignedTask]

        public init(test: SubjectTest, task: KognitaModels.MultipleChoiceTask, choises: [SubjectTest.MultipleChoiseTaskContent.Choise], testTasks: [SubjectTest.AssignedTask]) {
            self.test = test
            self.task = task
            self.choises = choises
            self.testTasks = testTasks
        }
    }
}
