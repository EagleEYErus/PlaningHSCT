//
//  NetworkService.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 17.05.2020.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    case put = "PUT"
}

protocol NetworkService {
    func get<T: Codable>(_ type: T.Type, path: String, completion: @escaping (T?, Error?) -> Void)
    func get<T: Codable>(_ model: T, path: String, completion: @escaping (Data?, Error?) -> Void)
    func post<T: Codable>(_ model: T, path: String, completion: @escaping (Data?, Error?) -> Void)
    func delete<T: Codable>(_ model: T, path: String, completion: @escaping (Data?, Error?) -> Void)
}

final class NetworkServiceImpl: NetworkService {
    static let shared: NetworkService = NetworkServiceImpl()
    
    private func getURL(path: String) -> URL {
        return URL(string: "https://localhost:8000" + path)!
    }
    
    private init() {}
    
    func get<T: Codable>(_ type: T.Type, path: String, completion: @escaping (T?, Error?) -> Void) {
        let url = getURL(path: path)
        let request = createRequest(url: url, method: .get)
        let task = dataTask(request: request) { data, error in
            guard let data = data, error == nil else {
                completion(nil, error)
                return
            }
            do {
                let response = try JSONDecoder().decode(type, from: data)
                completion(response, error)
            }
            catch(let error) {
                completion(nil, error)
            }
        }
        task.resume()
    }
    
    func get<T: Codable>(_ model: T, path: String, completion: @escaping (Data?, Error?) -> Void) {
        guard let data = try? JSONEncoder().encode(model) else {
            return
        }
        let url = getURL(path: path)
        let request = createRequest(url: url, method: .get, body: data)
        let task = dataTask(request: request) { data, error in
            completion(data, error)
        }
        task.resume()
    }
    
    func post<T: Codable>(_ model: T, path: String, completion: @escaping (Data?, Error?) -> Void) {
        guard let data = try? JSONEncoder().encode(model) else {
            return
        }
        let url = getURL(path: path)
        let request = createRequest(url: url, method: .post, body: data)
        let task = dataTask(request: request) { data, error in
            completion(data, error)
        }
        task.resume()
    }
    
    func delete<T: Codable>(_ model: T, path: String, completion: @escaping (Data?, Error?) -> Void) {
        guard let data = try? JSONEncoder().encode(model) else {
            return
        }
        let url = getURL(path: path)
        let request = createRequest(url: url, method: .delete, body: data)
        let task = dataTask(request: request) { data, error in
            completion(data, error)
        }
        task.resume()
    }
}

extension NetworkServiceImpl {
    private func createRequest(url: URL, method: HTTPMethod, body: Data? = nil) -> URLRequest {
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-type")
        request.httpMethod = method.rawValue
        request.timeoutInterval = 15
        request.httpBody = body
        return request
    }
    
    private func dataTask(request: URLRequest, completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: request, completionHandler: { [weak self] data, response, error in
            self?.log(request: request, dataResponse: data, response: response, error: error)
            guard error == nil else {
                completion(data, error)
                return
            }
            completion(data, error)
        })
    }
    
    private func log(request: URLRequest, dataResponse: Data?, response: URLResponse?, error: Error?) {
        print("===========================================")
        print("|| 🌐 URL PATH: \(request.url?.path ?? "nil") .\(request.httpMethod ?? "nil")")
        print("|| ↗️ Request body: \(String(data: request.httpBody ?? Data(), encoding: .utf8) ?? "nil")")
        print("|| ❌ Error: \(error?.localizedDescription ?? "nil")")
        print("|| ↩️ Response: \(String(data: dataResponse ?? Data(), encoding: .utf8) ?? "nil")")
        if let statusCode = (response as? HTTPURLResponse)?.statusCode {
            print("|| 💬 Status code: \(statusCode)")
        }
        print("===========================================")
    }
}

