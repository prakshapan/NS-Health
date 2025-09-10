//
//  NetworkManager.swift
//  NSHealthTakeHome
//
//  Created by Praks on 06/09/2025.
//
import Foundation

protocol NetworkService {
    func request<T: Decodable>(_ urlRequest: URLRequest, as type: T.Type) async throws -> T
}

// Define a protocol to allow mocking URLSession
protocol URLSessionProtocol {
    func data(for request: URLRequest) async throws -> (Data, URLResponse)
}

// Extend URLSession to conform
extension URLSession: URLSessionProtocol {}

final class NetworkManager: NetworkService {
    private let session: URLSessionProtocol
    private let jsonDecoder: JSONDecoder
    
    init(session: URLSessionProtocol = URLSession.shared,
         jsonDecoder: JSONDecoder = JSONDecoder()) {
        self.session = session
        self.jsonDecoder = jsonDecoder
    }

    func request<T: Decodable>(_ urlRequest: URLRequest, as type: T.Type) async throws -> T {
        do {
            let (data, response) = try await session.data(for: urlRequest)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.invalidResponse
            }

            guard 200..<300 ~= httpResponse.statusCode else {
                throw NetworkError.unexpectedStatusCode(httpResponse.statusCode)
            }

            return try jsonDecoder.decode(T.self, from: data)
        } catch let error as DecodingError {
            throw NetworkError.decodingFailed(error)
        } catch {
            throw NetworkError.requestFailed(error)
        }
    }
}



