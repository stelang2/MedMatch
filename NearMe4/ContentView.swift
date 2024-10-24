//
//  ContentView.swift
//  NearMe2
//
//  Created by Shivum telang on 7/11/24.
//




import SwiftUI
import MapKit
import Combine

import Foundation


struct ContentView: View {
    @ObservedObject var sharedData: SharedData 
//    @State var name: String = ""
//    @State var phone: String = ""
//    @State var rating: Double = 0
//    @State var address: String = ""
//    @State var location: String = ""
   // @StateObject var chatController:ChatController = .init()
    @ObservedObject var locationManager = LocationManager()
    @StateObject var networkManager = NetworkManager()
    @State  var search:String = ""
    @State private var landmarks: [Landmark] = [Landmark]()
    @State private var tapped:Bool = false
    
    private func getNearByLandMarks(){
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = search
        let search = MKLocalSearch(request: request)
        search.start { (response,error) in
            if let response = response {
                let mapItems = response.mapItems
                self.landmarks = mapItems.map {
                    Landmark(placemark:$0.placemark)
                }
            }
        }
    }
    func calculateOffset() -> CGFloat {
        
        if self.landmarks.count > 0 && !self.tapped {
            return UIScreen.main.bounds.size.height - UIScreen.main.bounds.size.height / 4
        }
        else if self.tapped {
            return 100
        } else {
            return UIScreen.main.bounds.size.height
        }
    }
    @State private var position = MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 53, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 2, longitudeDelta: 2)))
   // @State private var position:MapCameraPosition = .userLocation(fallback:.automatic)
  
    @State var token: Set<AnyCancellable> = []
    @State var coordinates: (lat: Double, lon: Double) = (0,0)
    @State var selectedLandmark:Business?
    @State var bus:Business?
    @State var color = false
    
    var body: some View {
       
        NavigationStack {
            ZStack(alignment:.top ) {
                
                Map {
                    ForEach(landmarks){ landmark in
                        Annotation(landmark.name, coordinate: landmark.coordinate){
                            Image(systemName:"star.circle")
                                .resizable()
                                .foregroundStyle( .blue)
                                .frame(width: 70, height: 70)
                                .background(.white)
                                .clipShape(.circle)
                                .onTapGesture {
                                    networkManager.fetchBusinesses(for: landmark.name)
                                    if let firstItem = networkManager.businesses.first{
                                        bus = networkManager.businesses.first
                                        self.selectedLandmark = bus
                                    }
                                     
                                    
                                }
                              
                                
                        }
                    }
                }.ignoresSafeArea()
                Menu {
                    Button(action: {
                        search = "Opthamologist"
                        self.getNearByLandMarks()
                    }, label: {
                        Text("Opthamologist")
                    })
                    Button(action: {
                        search = "Oncologist"
                        self.getNearByLandMarks()
                    }, label: {
                        Text("Oncologist")
                    })
                    Button(action: {
                        search = "Primary Care Physician"
                        self.getNearByLandMarks()
                    }, label: {
                        Text("PCP")
                    })
                    Button(action: {
                        search = "Rheumatologist"
                        self.getNearByLandMarks()
                    }, label: {
                        Text("Rheumatologist")
                    })
                    Button(action: {
                        search = "Endocrinologist"
                        self.getNearByLandMarks()
                    }, label: {
                        Text("Endocronologist")
                    })
                    Button(action: {
                        search = "Hematologist"
                        self.getNearByLandMarks()
                    }, label: {
                        Text("Hematologist")
                    })
                    Button(action: {
                        search = "Urologist"
                        self.getNearByLandMarks()
                    }, label: {
                        Text("Urologist")
                    })
                    Button(action: {
                        search = "Gynecologist"
                        self.getNearByLandMarks()
                    }, label: {
                        Text("Gynecologist")
                    })
                    Button(action: {
                        search = "Gynecologist"
                        self.getNearByLandMarks()
                    }, label: {
                        Text("Gynecologist")
                    })
                    Button(action: {
                        search = "Nephrologist"
                        self.getNearByLandMarks()
                    }, label: {
                        Text("Nephrologist")
                    })
                    
                   
                } label: {
                    Label(
                        
                        title: { Text("Specialist Dropdown").font(.title).bold().foregroundColor(.black).cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/) },
                        icon: { Image(systemName: "plus.circle.fill").foregroundColor(.black).bold().font(.largeTitle) }
                    )
                }
                PlaceListView(landmarks: self.landmarks){
                    self.tapped.toggle()
                }.transaction { transaction in
                    transaction.animation = .spring()
                }
                .offset(y:calculateOffset())
                .padding()
                if let bus = selectedLandmark {
                    VStack {
                                        Spacer()
                        VStack(alignment: .leading, spacing: 10) {
                          
                            HStack{
                                Spacer()
                                
                                Text(bus.name)
                                    .bold()
                                    .font(.caption)
                                Spacer()
                            }
                            HStack {
                                Spacer()
                                Image(systemName: "star.circle.fill").foregroundColor(.yellow).bold().font(.title3)
                                Text("\(formatRating(bus.rating)) Stars")
                                    .bold()
                                    .foregroundColor(.yellow)
                                Spacer()
                            }
                            HStack {
                                Spacer()
                                Image(systemName: "phone.circle.fill").foregroundColor(.red).bold().font(.title3)
                                if let phone = bus.phone {
                                    Text(" \(phone)").foregroundColor(.red).bold().font(.title3)
                                } else {
                                    Text("No phone number available")
                                }
                                Spacer()
                            }
                            HStack {
                                Spacer()
                                Image(systemName: "house.circle.fill").foregroundColor(.blue).bold().font(.title3)
                                if let address = bus.location.address1 {
                                    Text("\(address)").foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/).bold().font(.title3)
                                }
                                Spacer()
                                
                            }
                            HStack {
                                Spacer()
                                Image(systemName: "text.below.photo").foregroundColor(.black).bold().font(.title3)
                                Text("\(bus.location.city), \(bus.location.state)").foregroundColor(.black).bold().font(.title3)
                                Spacer()
                            }
                            HStack {
                                Spacer()
                                Button( action: {
                                    sharedData.name = bus.name
                                    sharedData.phone = bus.phone!
                                    sharedData.rating = bus.rating
                                    sharedData.address = bus.location.address1!
                                    sharedData.locationCity = bus.location.city
                                    sharedData.locationState = bus.location.state
                                    }
                                ) {
                                    HStack {
                                        Image(systemName: "hand.thumbsup.circle.fill").foregroundColor(.yellow).bold().font(.title2)
                                        Text("Like And Save").foregroundColor(.yellow).bold().font(.title2)
                                        Spacer()
                                    }
                                }
                                
                            }
                            
                                            Button(action: {
                                               
                                                    withAnimation {
                                                        self.selectedLandmark = nil
                                                }
                                            }) {
                                                HStack {
                                                    Spacer()
                                                    Text("Close")
                                                        .padding()
                                                        .background(Color.blue)
                                                        .foregroundColor(.white)
                                                        .cornerRadius(8)
                                                    Spacer()
                                                }
                                            } .onAppear{
                                                
                                                print(sharedData.name)
                                              }
                                        }
                                 
                                      
                        .padding()
                                        .background(Color.white)
                                        .cornerRadius(10)
                                        .shadow(radius: 5)
                                        .padding()
                                        .frame(width: 265)
                                    }
                                    
                }
            }
        }
        
    }

}
#Preview {
    ContentView(sharedData: SharedData())
}
