//
//  ProfileView.swift
//  NearMe4
//
//  Created by Shivum telang on 10/17/24.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var sharedData: SharedData
//    @Binding var userName: String
//    @Binding var name: String
//    @Binding var phone: String
//    @Binding var rating: String
//    @Binding var address: String
//    @Binding var location: String
    @State var officeNamesList: [DoctorInfo] = []
    @State var yOffset:CGFloat = -250
//    @State var string: String = ""
//    @State var string2: String = ""
    var body: some View {
        ZStack{
            Color.blue.opacity(0.8).ignoresSafeArea()
            VStack{
                
                    Text("Welcome " + sharedData.userName).offset(y:-270).bold().font(.title).foregroundColor(.white)
                    Text("Like And Saved Library").padding().background(Color.purple.opacity(0.5)).clipShape(Rectangle()).foregroundColor(.white).cornerRadius(15).offset(y:-260).bold().font(.title2)
                    
                    if sharedData.name != ""{
                        Text(sharedData.name).font(.title2).fontWeight(.semibold).offset(y:yOffset).foregroundColor(.white)
                        HStack{
                            Spacer()
                            Image(systemName: "star.circle.fill").foregroundColor(.yellow).bold().font(.title3)
                            Text("\(formatRating(sharedData.rating)) Stars").font(.title3).foregroundColor(.yellow)
                            Spacer()
                        }.offset(y:yOffset + 15)
                        HStack{
                            Spacer()
                            Image(systemName: "phone.circle.fill").foregroundColor(.red).bold().font(.title3)
                            Text(sharedData.phone).font(.title3).foregroundColor(.red).bold().font(.title3)
                            Spacer()
                        }.offset(y:yOffset + 30)
                        
                        HStack{
                            Spacer()
                            Image(systemName: "house.circle.fill").foregroundColor(.purple).bold().font(.title3)
                            Text(sharedData.address).font(.title3).foregroundColor(.purple).bold().font(.title3)
                            Spacer()
                        }.offset(y:yOffset + 45)
                        HStack{
                            Spacer()
                            Image(systemName: "text.below.photo").foregroundColor(.black).bold().font(.title3)
                            Text("\(sharedData.locationCity), \(sharedData.locationState)").font(.title3).foregroundColor(.black).bold().font(.title3)
                            Spacer()
                        }.offset(y:yOffset + 60)
                        Rectangle()
                                          
                                       .frame(height: 1) // Set the height of the line
                                       .foregroundColor(.black) // Optional: Set the color of the line
                                       .edgesIgnoringSafeArea(.horizontal)
                                       .bold()
                                       .offset(y: yOffset + 75)
                                       .onAppear{
                                         
                                       }
                    
                }
            }
            .onAppear{
                officeNamesList.append(DoctorInfo(name: sharedData.name, phone: sharedData.phone, rating: sharedData.rating, address: sharedData.address, location: sharedData.locationCity))
                print(sharedData.userName)
                print(sharedData.name)
      }
    }
}
}

#Preview {
    ProfileView(sharedData: SharedData())
}
