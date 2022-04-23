//
//  DetailUser.swift
//  ceibaApp (iOS)
//
//  Created by inicial on 22/4/22.
//

import SwiftUI

struct DetailUser: View {
    let item : UserModelElement
    @StateObject var postObserver = PostViewModel()
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    ZStack {
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(.white)
                                    .shadow(radius: 10)

                                VStack {
                                    Text(item.name)
                                        .font(.title2)
                                        .foregroundColor(.green)

                                    Text(item.phone)
                                        .font(.body)
                                        .foregroundColor(.black)
                                    Text(item.email)
                                        .font(.body)
                                        .foregroundColor(.black)
                                }
                                .padding(20)
                                .multilineTextAlignment(.trailing)
                            }.padding(20)
                    
                    if (postObserver.postListModel.isEmpty){
                        ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .green))
                                                .scaleEffect(2)
                                                .padding(6)
                    }else {
                        Text("Post:")
                        ForEach(postObserver.postListModel, id: \.self.userID  ) { item in
                            
                            ZStack {
                                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                                            .fill(.white)
                                            .shadow(radius: 10)

                                        VStack {
                                            Text(item.title)
                                                .font(.title2)
                                                .foregroundColor(.green)

                                            Text(item.body)
                                                .font(.body)
                                                .foregroundColor(.black)
                                            
                                        }
                                        .padding(20)
                                        .multilineTextAlignment(.trailing)
                                    }.padding(20)
                            
                                
                            }
                        }
                    }
            }
           
            }
        .onAppear{
            print(String(item.id))
            postObserver.httpListPost(idPost: String(item.id))
              
               
            }
    
           
    }
        
    
}

struct DetailUser_Previews: PreviewProvider {
    static var previews: some View {
        DetailUser(item: UserModelElement(id: 1, name: "Leanne Graham", username: "String", email: "Sincere@april.biz", address: Address(street: "", suite: "", city: "", zipcode: "", geo: Geo(lat: "", lng: "")), phone: "1-770-736-8031 x56442", website: "String", company: Company(name: "", catchPhrase: "", bs: "")))
    }
}
