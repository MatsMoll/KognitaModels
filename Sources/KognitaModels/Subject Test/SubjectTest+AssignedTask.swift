extension SubjectTest {
    public struct AssignedTask: Codable {
        public init(testTaskID: Int, isCurrent: Bool) {
            self.testTaskID = testTaskID
            self.isCurrent = isCurrent
        }

        public let testTaskID: Int
        public let isCurrent: Bool
    }
}
