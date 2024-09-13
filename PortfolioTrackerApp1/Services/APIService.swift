import Foundation
import Combine

class APIService {
    static let shared = APIService()
    
    private init() {}
    
    func fetchNAV(for asset: Asset) -> AnyPublisher<Double, Error> {
        // Implement API call to fetch NAV
        // For now, we'll return a dummy value
        return Just(100.0)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}