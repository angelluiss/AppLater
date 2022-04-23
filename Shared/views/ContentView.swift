//
//  ContentView.swift
//  Shared
//
//  Created by AR on 22/4/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @StateObject var userObserver = UserViewModel()
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    
    private var items: FetchedResults<Item>
    
    @State var searchText = ""
    @State var toDetail = false
  
    
    var body: some View {
        NavigationView {
            ScrollView{
                VStack{
                    TextField("Search", text: $searchText)
                    Divider()
                        .frame(height: 2)
                        .background(Color.green).padding(.bottom)
                   
                }.padding(10)
               
                if (userObserver.userListModel.isEmpty){
                    ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .green))
                                            .scaleEffect(2)
                                            .padding(6)
                }else {
                    ForEach((userObserver.userListModel).filter({item2 in
                        "\(item2)".contains( searchText) || searchText.isEmpty
                    }),id: \.self.id ) { item in
                        
                        
                        
                        NavigationLink(
                            destination: DetailUser(item: item),
                                   
                                   label: {
                                       ZStack {
                                                   RoundedRectangle(cornerRadius: 10, style: .continuous)
                                                       .fill(.white)
                                                       .shadow(radius: 10)

                                                   VStack (alignment: .leading){
                                                       VStack{
                                                           Text(item.name)
                                                               .font(.title)
                                                               .foregroundColor(.green)
                                                               .padding(2)

                                                           HStack{
                                                               Image(systemName: "phone.fill")
                                                               Text(item.phone)
                                                                   .font(.body)
                                                                   .foregroundColor(.black)
                                                           }
                                                           
                                                          
                                                           
                                                           HStack{
                                                               Image(systemName: "tray.fill")
                                                               Text(item.email)
                                                                   .font(.body)
                                                                   .foregroundColor(.black)
                                                           }
                                                       }
                                                       
                                                       
                                                       Text("Ver publicaciones")
                                                           .font(.title2)
                                                           .foregroundColor(.green)
                                                      
                                                       }.padding(30)
                                   
                                                   }
                                                   .padding(20)
                                   })
                    }
                }
                
            }.padding(10)
            
            
            
            .toolbar {
                #if os(iOS)
                                ToolbarItem(placement: .navigationBarTrailing) {
                                    EditButton()
                                }
                #endif
                                ToolbarItem {
                                    Button(action: addItem) {
                                        Label("Add Item", systemImage: "plus")
                                    }
                                }
            }
            Text("Select an item")
        }
        
        .onAppear{
            userObserver.httpListUsers()
          
           
        }
    }
    
    
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)
            
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
