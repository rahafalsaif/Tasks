//
//  ContentView.swift
//  MarsoolMyProject
//
//  Created by rahaf alsaif on 17/01/1444 AH.
//

import SwiftUI


struct BillionaireListView: View {

    @State var Billi : [WelcomeElement] = []
    @State var results = [WelcomeElement]()

    @State var data: Response?
    var body: some View {
       
   
        NavigationView{
            
            
            
            
            List(results, id: \.id) { billi in
                HStack{
                    AsyncImage(url: URL(string: billi.squareImage!)) { phase in
                        if let image = phase.image {
                            image // Displays the loaded image.
                                .resizable()
                                .scaledToFit()
                        } else if phase.error != nil {
                            Color.gray // Indicates an error.
                        } else {
                            Color.blue // Acts as a placeholder.
                        }
                    }
//                    AsyncImage(url: URL(string: billi.squareImage!))
////                    { phase in
////                        if let image = phase.squareImage {
////                            squareImage.resizable()
////                        }
////
////                    }
////                    Image(billi.squareImage!)
//                        .resizable()
//                        .scaledToFit()
////                        .frame(height: 70 )
//                        .frame(width: 70, height: 70, alignment:.leading)
//                        .cornerRadius(4)
//                        .padding(.vertical,4)

                    VStack(alignment: .leading, spacing: 6){
                        Text(billi.person.name)
                            .fontWeight(.semibold)
                            .lineLimit(2)
                            .minimumScaleFactor(0.5)
//
                       Text(String(billi.rank))
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        Text(billi.countryOfCitizenship)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    VStack(alignment: .trailing, spacing: 6){
                       

                        Text(String(billi.birthDate!))
                            .font(.subheadline)
                            .foregroundColor(.secondary)

                        Text(billi.source)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
                NavigationLink(destination: BillionaireDetailView(Billionaire:  billi)
                               , label: {

//                    BillionaireCell(Billionaire: Billi)
                }
                )
                
            }
            
            .navigationTitle("Billionaire top 100")
            .onAppear(perform: loadData)
        }
  
        

    }
    func loadData() {
        guard let url = URL(string: "https://forbes400.herokuapp.com/api/forbes400?limit=100") else {
            print("Your API end point is Invalid")
            return
        }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let data = data {
                if let response = try? JSONDecoder().decode([WelcomeElement].self, from: data) {
                    DispatchQueue.main.async {
                        self.results = response
                    }
                    return
                }
            }
        }.resume()
    }
}
struct  BillionaireCell: View{
  @State  var Billionaire: [WelcomeElement] = []
    @State var results = [WelcomeElement]()
  //  var Billi : WelcomeElement
    var body: some View {
        
        List(results, id: \.id) { item in
            VStack(alignment: .leading) {
                
                Text(item.person.name)
                //                Text("\(item.personName) ")
                
                
            }
            
        }.onAppear(perform: loadData)
        

        
    }
    
    
    
    func loadData() {
        guard let url = URL(string: "https://forbes400.herokuapp.com/api/forbes400?limit=100") else {
            print("Your API end point is Invalid")
            return
        }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let data = data {
                if let response = try? JSONDecoder().decode([WelcomeElement].self, from: data) {
                    DispatchQueue.main.async {
                        self.results = response
                    }
                    return
                }
            }
        }.resume()
    }
    
    
}
let url = "https://forbes400.herokuapp.com/api/forbes400/"
 func getData(from url: String){
   let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: {data,response,error in
        guard let data = data, error == nil else{
            print ("something went wrong")
            return
        }
        var result: [WelcomeElement]?
        do{
            result =  try JSONDecoder().decode([WelcomeElement].self, from: data)
        }
        catch{
            print ("faild to convert \(error.localizedDescription)")
        }
        guard let json = result else{
            return
        }
       print (json[0].name)
//        print (json.results.FullName)
//        print (json.results.NetWorth)
//        print (json.results.Country)
    })
        task.resume()
}

struct Response: Codable{
    let results: MyResult
    let status: String
    
}
struct MyResult: Codable{
    
//    let id = UUID()
    let imageName: String
    let FullName: String
    let NetWorth: String
    let Country: String
    let City:String
    let Age: String
    let Source: String
    let Industry: String
    let Bios: String
    let viewCount: Int
    let uploadDate: String
    let url: URL
    
    
    
    
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BillionaireListView()
     
    }
}
import Foundation

class apiCall {
    func getUsers(completion:@escaping ([WelcomeElement]) -> ()) {
        guard let url = URL(string: "https://forbes400.herokuapp.com/api/forbes400/") else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let users = try! JSONDecoder().decode([WelcomeElement].self, from: data!)
            print(users)
            
            DispatchQueue.main.async {
                completion(users)
            }
        }
        .resume()
    }
}
