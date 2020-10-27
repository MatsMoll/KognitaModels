extension Topic {
    public struct UserOverview: Codable {
        public init(id: Topic.ID, name: String, typingTaskCount: Int, multipleChoiceTaskCount: Int, userLevel: Topic.UserLevel) {
            self.id = id
            self.name = name
            self.typingTaskCount = typingTaskCount
            self.multipleChoiceTaskCount = multipleChoiceTaskCount
            self.userLevel = userLevel
        }

        public let id: Topic.ID
        public let name: String
        public let typingTaskCount: Int
        public let multipleChoiceTaskCount: Int
        public let userLevel: Topic.UserLevel
        
        public var totalTaskCount: Int { typingTaskCount + multipleChoiceTaskCount }
    }
}
