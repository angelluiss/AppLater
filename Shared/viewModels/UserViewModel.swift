//
//  UserViewModel.swift
//  ceibaApp (iOS)
//
//  Created by AR on 22/4/22.
//

import Foundation


class UserViewModel: ObservableObject {
    @Published var userListModel : [UserModelElement] = []

    
    func httpListUsers(){
        let url = URL(string: ConstansUtils.URLusers)!
        
        var request = URLRequest(url: url,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) {(data, response, error) in
            do {
                if data != nil {
                    
                    let decodedData = try JSONDecoder().decode([UserModelElement].self, from: data!)
                    
                    print("JSONDecodificado: \(decodedData)")
                    
                    DispatchQueue.main.async {
                       // self.userListModel.append(contentsOf: decodedData)
                        self.userListModel = decodedData
                        print("data plicy \(self.userListModel[0].username)")
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
