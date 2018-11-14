

struct Card: Codable {
    let name: String
    let image: String
    
    private enum CodingKeys: String, CodingKey {
        case name
        case image
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        image = try values.decode(String.self, forKey: .image)
        
    }
}
