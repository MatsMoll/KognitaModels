import Foundation

extension User {

    public enum Update {

        /// The data needed to update a `User`
        public struct Data: Codable {

            /// User's full name.
            public let username: String

            /// User's desired password.
            public let password: String

            /// User's password repeated to ensure they typed it correctly.
            public let verifyPassword: String
        }

        public typealias Response = User
    }
}
