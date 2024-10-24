import Foundation

struct Business: Codable, Identifiable {
    var id: String
    var name: String
    var rating: Double
    var reviewCount: Int?
    var location: Location
    var imageUrl: String?
    var url: String
    var description:String?
    var phone:String?
    var snippet: String?

    enum CodingKeys: String, CodingKey {
        case id
                case name
                case rating
                case location
                case url
                case phone
                case reviewCount = "review_count"
                case imageUrl = "image_url"
                case snippet = "snippet_text"
    }
}

struct Location: Codable {
    var address1: String?
    var city: String
    var state: String
    var country: String
}

struct Coordinates: Codable {
    var latitude: Double
    var longitude: Double
}

struct YelpSearchResponse: Codable {
    var businesses: [Business]
}
