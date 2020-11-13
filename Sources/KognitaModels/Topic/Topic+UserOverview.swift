extension Topic {

    /// A topic representation that contains more detailed information
    /// Contains values that is tailered to a `User`
    public struct UserOverview: Codable {
        public init(id: Topic.ID, name: String, typingTaskCount: Int, multipleChoiceTaskCount: Int, userLevel: Topic.UserLevel) {
            self.id = id
            self.name = name
            self.typingTaskCount = typingTaskCount
            self.multipleChoiceTaskCount = multipleChoiceTaskCount
            self.userLevel = userLevel
        }

        /// The topic ID
        public let id: Topic.ID

        /// The topic name
        public let name: String

        /// The number of typing tasks in the `Topic`
        public let typingTaskCount: Int

        /// The number of multiple choice tasks in the `Topic`
        public let multipleChoiceTaskCount: Int

        /// The `User`s level in the `Topic`
        public let userLevel: Topic.UserLevel

        /// The total number of tasks in the topic
        public var totalTaskCount: Int { typingTaskCount + multipleChoiceTaskCount }
    }
}
