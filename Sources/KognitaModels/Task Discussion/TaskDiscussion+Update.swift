public struct NoData: Codable {
    public init() {}
}

extension TaskDiscussion {

    public enum Update {
        public struct Data: Codable {
            public let description: String
        }

        public typealias Response = NoData
    }
}
