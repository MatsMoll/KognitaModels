import Foundation

extension TaskDiscussionResponse {
    public struct Create {
        public struct Data: Codable {
            public let response: String
            public let discussionID: TaskDiscussion.ID

            public init(response: String, discussionID: TaskDiscussion.ID) {
                self.response = response
                self.discussionID = discussionID
            }
        }

        public struct Response: Codable {
            public init() {}
        }
    }
}
