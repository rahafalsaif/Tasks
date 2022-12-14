//
//  BillionaireDetailView.swift
//  MarsoolMyProject
//
//  Created by rahaf alsaif on 17/01/1444 AH.
//

import SwiftUI

struct BillionaireDetailView: View {
    var Billionaire: WelcomeElement
    var body: some View {
        VStack(spacing:20){
            Spacer()
//            Image(Billionaire.person.squareImage ?? "")
//                .resizable()
//                .scaledToFit()
//                .frame(height: 100)
//                .cornerRadius(12)
            Text(Billionaire.person.name)
                .font(.title2)
                .fontWeight(.semibold)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            Text(Billionaire.bios[0])
                .font(.subheadline)
                .foregroundColor(.secondary)
            HStack(spacing: 40){
                Label("\(Billionaire.countryOfCitizenship)", systemImage: "mappin.and.ellipse")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
               
                Label("\(Billionaire.industries[0].rawValue)", systemImage: "globe.europe.africa")
//                Text(Billionaire.industries[0].rawValue)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Text(Billionaire.bio)
                .padding()

            Label("\(Billionaire.finalWorth)", systemImage: "dollarsign.circle")
                .font(.subheadline)
//                .foregroundColor(.secondary)
            Spacer()
            Link(destination:URL(string: Billionaire.uri)!, label:  {
                Text("Explore more")
                    .bold()
                    .font(.title2)
                    .frame(width: 270, height: 50)
                    .background(Color(.systemRed))
                
                    .foregroundColor(.white)
                    .cornerRadius(10)
            })
        }.padding()
    }
}

//struct BillionaireDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        BillionaireDetailView(Billionaire: WelcomeElement)
//    }
//}
