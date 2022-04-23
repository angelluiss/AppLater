//
//  PostViewModel.swift
//  ceibaApp (iOS)
//
//  Created by inicial on 22/4/22.
//

import Foundation


class PostViewModel: ObservableObject {
    @Published var postListModel : [PostModelElement] = []

    
    func httpListPost(idPost: String ){
        let url = URL(string: ConstansUtils.URLpost + idPost)!
        
        var request = URLRequest(url: url,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) {(data, response, error) in
            do {
                if data != nil {
                    
                    let decodedData = try JSONDecoder().decode([PostModelElement].self, from: data!)
                    
                    print("JSONDecodificado: \(decodedData)")
                    
                    DispatchQueue.main.async {
                      
                        self.postListModel = decodedData
                        print("data plicy \(self.postListModel[0].title)")
                        self.objectWillChange.send()
                        
                    }
                    
                    
                } else {
                    print("No existen datos en el json recuperado")
                }
            } catch {
                print("Error: \(error)")
            }
        }.resume()
    }
   
    

 
}

