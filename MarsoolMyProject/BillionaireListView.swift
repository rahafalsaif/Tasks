//
//  ContentView.swift
//  MarsoolMyProject
//
//  Created by rahaf alsaif on 17/01/1444 AH.
//

import SwiftUI
struct Person: Codable {
    let name, uri: String
    let imageExists: Bool
    let squareImage: String?
    let birthDate: Date?
}
struct BillionaireListView: View {
    
    @State var Billi : [WelcomeElement] = []
    @State var results = [WelcomeElement]()
    
    @State var data: Response?
    let imageSize: CGFloat = 100
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "mm/dd/yyyy"
        return formatter
    }
    
    
    var body: some View {
        
        
        NavigationView{
            
            
            
            
            List(results, id: \.id) { billi in
               
                NavigationLink(destination: BillionaireDetailView(Billionaire:  billi)
                               , label: {
                    
                    //                    BillionaireCell(Billionaire: Billi)
                    HStack{
                        AsyncImage(url: URL(string: billi.squareImage!)) { phase in
                            if let image = phase.image {
                                image // Displays the loaded image.
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width:imageSize, height: imageSize)
                                    .clipped()
                            } else if phase.error != nil {
                                
                                
                                Color.gray // Indicates an error.
                                    .frame(width:imageSize, height: imageSize)
                            } else {
                                Color.blue // Acts as a placeholder.
                                    .frame(width:imageSize, height: imageSize)
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
                        HStack{
                        VStack(alignment: .leading, spacing: 6){
                            Text(billi.person.name)
                                .fontWeight(.semibold)
                                .lineLimit(2)
                                .minimumScaleFactor(0.5)
                            
                            
                            Text(dateFormatter.string(from: billi.birthDate!))
    //                                                Text(billi.birthDate!)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            //
                            
                            Text(billi.countryOfCitizenship)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                            Spacer()
                        VStack(alignment: .trailing, spacing: 6){
                            
                            Text(String(billi.rank))
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            //
                            
                            Text(billi.source)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }}
                    }
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
        
//
//                let decoder = JSONDecoder()
//                decoder.dateDecodingStrategy = .formatted(dateFormatter)
//
//                guard let data = try? Data(contentsOf: URL(string: "https://forbes400.herokuapp.com/api/forbes400?limit=100")!) else {
//                    fatalError()
//                }
//                if let decoded = try? decoder.decode([Person].self, from: data) {
//                    print(decoded)
//                } else {
//                    print("Cannot decode")
//                }
        
        
        
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
            
            //            if let data = data {
            //                if let response = try? JSONDecoder().decode([WelcomeElement].self, from: data) {
            //                    DispatchQueue.main.async {
            //                        self.results = response
            //                    }
            //                    return
            //                }
            //            }
            
            do {
                let response = try JSONDecoder().decode([WelcomeElement].self, from: data!)
                DispatchQueue.main.async {
                    self.results = response
                    print(self.results)
                }
            } catch {
                print(error)
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



//
