
extension Topic {
    public struct UserOverview: Codable {
        public init(id: Topic.ID, name: String, numberOfTasks: Int, userLevel: Topic.UserLevel) {
            self.id = id
            self.name = name
            self.numberOfTasks = numberOfTasks
            self.userLevel = userLevel
        }

        public let id: Topic.ID
        public let name: String
        public let numberOfTasks: Int
        public let userLevel: Topic.UserLevel
    }
}
