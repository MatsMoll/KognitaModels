import Foundation

public struct TaskDiscussion: Codable, Identifiable {

    public let id: Int
    public let description: String
    public let createdAt: Date?
    public let username: String
    public let newestResponseCreatedAt: Date
    public let isNew: Bool

    public init(id: TaskDiscussion.ID, description: String, createdAt: Date?, username: String, newestResponseCreatedAt: Date, isNew: Bool = false) {
        self.id = id
        self.description = description
        self.createdAt = createdAt
        self.username = username
        self.newestResponseCreatedAt = newestResponseCreatedAt
        self.isNew = isNew
    }
}

extension TaskDiscussion: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
}

public extension Array where Element: Hashable {
    func removingDuplicates() -> [Element] {
        var addedDict = [Element: Bool]()

        return filter {
            addedDict.updateValue(true, forKey: $0) == nil
        }
    }

    mutating func removeDuplicates() {
        self = self.removingDuplicates()
    }
}
