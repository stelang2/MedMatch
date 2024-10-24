//
//  OrigView.swift
//  NearMe4
//
//  Created by Shivum telang on 9/23/24.
//

import SwiftUI

struct OrigView: View {
    @StateObject var sharedData = SharedData()
    @State private var isMenuOpen = false
    @FocusState private var focus:Bool
    @FocusState private var focusTwo:Bool
    
    @State var string: String = ""
    @State var stringTwo: String = ""
    @State var userName: String = ""
//    @State var passWord: String = ""
    @State private var isDropdownOpen = false
    var body: some View {
        
        
       
            NavigationStack {
                ZStack {
                    Color(.blue).opacity(0.8).ignoresSafeArea()
                    VStack{
                        HStack {
                            Spacer()
                            Image(systemName: "stethoscope.circle").font(.largeTitle).foregroundStyle(.white).bold().offset(y:-130)
                            
                            Text("MedMatch").bold()
                                .font(.largeTitle).foregroundStyle(.white).offset(y:-130)
//                            Image( "1-81db8fe5").foregroundStyle(.white).bold().offset(y:-115).font(.caption2)
                            Image(systemName: "stethoscope.circle").font(.largeTitle).foregroundStyle(.white).bold().offset(y:-130)
                            
                            Spacer()
                            
                        }
//                        Image(systemName: "binoculars").font(.largeTitle).bold().offset(y:-260)
                        // Spacer()
                        HStack {
                            Image(systemName: "star.circle.fill")
                            Image(systemName: "star.circle.fill")
                            Image(systemName: "star.circle.fill")
                            Image(systemName: "star.circle.fill")
                            Image(systemName: "star.circle.fill")
                        }.foregroundColor(.yellow).font(.largeTitle).offset(y:-125).offset(x:-5)
                        VStack{
                          
                            Text("Sign In").bold().offset(y:-95).font(.title2)
                            Text("Email Or Username").bold().offset(y:-40).font(.title3)
                            HStack {
                                TextField("Type Here...", text: self.$string, axis: .vertical).padding().onSubmit {
                               
                                    sharedData.userName = string
                                    string = ""
                                   // print(sharedData.userName)
                                
                                }
                                .focused($focus)
                                Button(action: {
                                    print("hello")
                                   string = ""
                                }, label: {
                                    Image(systemName: "paperplane").offset(x:-35)
                                })
                                
                            }.onAppear{
                                focus = true
                            }.background(Color.gray.opacity(0.1)).cornerRadius(15).foregroundColor(.black).offset(y:-35)
                            Text("Password").bold().offset(y:0).font(.title3)
                            HStack {
                                TextField("Type here...", text: self.$stringTwo, axis: .vertical).padding().onSubmit {
                                    stringTwo = ""                                }.focused($focusTwo)
                                Image(systemName: "paperplane").offset(x:-35)
                            }.onAppear{
                                focusTwo = true
                            }
                            .background(Color.gray.opacity(0.1)).cornerRadius(15).foregroundColor(.black).offset(y:10)
                            Button(action: {
//                                string = userName
//                                stringTwo = passWord
//                                string = ""
//                                stringTwo = ""
                            }, label: {
                                Text("Save Info").padding().background(Color.blue).clipShape(Rectangle()).foregroundColor(.white).cornerRadius(15).offset(y:50)
                            })
                           
                            Text("Need Help?").offset(y:100)
                            NavigationLink("Click Here", destination: GPTView()).foregroundColor(.purple).offset(y:100).bold()
                        }
                        
                    
        

                        HStack{
                         
                            HStack {
                                VStack{
                                    Image(systemName: "house.circle").foregroundColor(.white)
                                        .bold()
                                        .offset(y:160)
                                            .offset(x:30)
                                        .font(.largeTitle)
                                    NavigationLink("Home", destination: OrigView())
                                        .bold()
                                        .foregroundColor(.white)
                                        .offset(y:160)
                                            .offset(x:30)
                                    
                                }
                               
                                VStack{
                                    Image(systemName: "person.circle")
                                        
                                        .foregroundColor(.white).bold()
                                        .offset(y:160)
                                            .offset(x:60)
                                        .font(.largeTitle)
                                    NavigationLink("Profile", destination: ProfileView(sharedData: sharedData))
                                        .bold()
                                        .foregroundColor(.white)
                                        .offset(y:160)
                                            .offset(x:60)
                                        
                                        
                                        
                                    //                                                    .font(.callout)
                                    
                                }
                                
                            
                                
                                
                                
                                
                                
                                VStack{
                                    Image(systemName: "mappin.and.ellipse.circle")
                                        .foregroundColor(.white).bold()
                                        .offset(y:160)
                                        .offset(x:93)
                                        .font(.largeTitle)
                                    NavigationLink("Maps", destination: ContentView(sharedData: sharedData))
                                        .bold()
                                        .foregroundColor(.white)
                                        .offset(y:160)
                                        .offset(x:93)
                                       
                                    //                                 .font(.callout)
                                    
                                }
                                
                                //.background(Color.black.opacity(0.2))
                               
                                
                                VStack{
                                    Image(systemName: "message.badge.circle")
                                        .foregroundColor(.white).bold()
                                        .offset(y:160)
                                            .offset(x:125)
                                        .font(.largeTitle)
                                    NavigationLink("MM AI", destination: GPTView())
                                        .bold()
                                        .foregroundColor(.white)
                                        .offset(y:160)
                                            .offset(x:125)
                                        
                                    //                                 .font(.callout)
                                    
                                }
                             //  .background(Color.black.opacity(0.2))
                                
                                
                                
                                
                                
                                
                                
                            }
                            
                            
                            Spacer()
                        }
                        
                        
                    }
                }
            }
            
        }
    }




#Preview {
    OrigView()
}
