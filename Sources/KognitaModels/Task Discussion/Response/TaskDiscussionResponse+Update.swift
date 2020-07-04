import Foundation

extension TaskDiscussionResponse {

    public enum Update {

        public struct Data: Codable {
            public let response: String
        }

        public struct Response: Codable {}
    }
}
