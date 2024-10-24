import Foundation

class NetworkManager: ObservableObject {
    @Published var businesses = [Business]()
    var locationManager = LocationManager()
    var apiKeyNum:Int = 1
    
    var apiKeys = ["5l119Qxi0EPRI21xJ2XOdOekvZWYKPyxhOYCai3Jcu9OASLb9lSlU7lPKh_USFvrmrslYDHdk6tmmeARPulVQM3yTXuulT2n27bCR0JZ0TJhalE4syqHmzexZ28ZZ3Yx", "j2HdsW6asEajJoF9FK7d2BKQKTJ8ta6kAzY-1MbJzk_VepksnIrrK6uqQwrA9eaCXO8oRBtpqWU0QCuUqG-GFk3435NXuaH0B6KU8Z6NTOIZIdqmClrH6zbgXW4ZZ3Yx"]
    
    func fetchBusinesses(for searchTerm: String) {
        
       let apiKey = apiKeys[apiKeyNum]
      
       
        guard let url = URL(string: "https://api.yelp.com/v3/businesses/search?term=\(searchTerm)&location=Pittsburgh,PA") else {
            return
        }
       
            var request = URLRequest(url: url)
            request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print("Request error: \(error.localizedDescription)")
                    return
                }
                
                if let httpResponse = response as? HTTPURLResponse {
                    if !(200...299).contains(httpResponse.statusCode) {
                        print("HTTP error: \(httpResponse.statusCode)")
                        return
                    }
                }
                
                guard let data = data else {
                    print("No data received")
                    return
                }
                
                do {
                    let result = try JSONDecoder().decode(YelpSearchResponse.self, from: data)
                                    DispatchQueue.main.async {
                                        self.businesses = result.businesses
                    }
                } catch {
                    print("Failed to decode JSON: \(error.localizedDescription)")
                    if let jsonString = String(data: data, encoding: .utf8) {
                        print("JSON Response: \(jsonString)")
                    }
                }
            }.resume()
        }
    }

