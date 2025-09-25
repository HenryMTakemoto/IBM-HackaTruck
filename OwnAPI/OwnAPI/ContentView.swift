//
//  ContentView.swift
//  OwnAPI
//
//  Created by Turma02-10 on 19/09/25.
//

import SwiftUI
import MapKit

struct SheetView: View{
    @Environment(\.dismiss) var dismiss
    @State var image: String = ""
    @State var name: String = ""
    @State var desc: String = ""
    var body: some View{
        ZStack{
            Rectangle().fill(.indigo).ignoresSafeArea()
            VStack{
                ZStack{
                    Rectangle().fill(.indigo).border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/).frame(width:300,height:300)
                    AsyncImage(url: URL(string: image )){image in
                        image.resizable()
                    }placeholder: {
                        ProgressView()
                    }.frame(width: 200, height: 200)
                }
                Text(name).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                ZStack{
                    Rectangle().fill(.green).frame(width: 200, height: 200)
                    VStack{
                        Text("Dono do estádio: " + desc)
                    }
                }
            }
         
        }
    }
}


struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    @State private var showingSheet = false
    @State private var selectedPoint = ""
    @State private var position =
    MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -14.2350, longitude: -51.9253),span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)))
    @State private var selectedLoc = Estadio(nomeEstadio: "", donoDoEstadio:"", capacidade: "", foto: "", latitude: 0, longitude: 0)
    
    var body: some View {
        ZStack{
            
            Map(position: $position) {
                ForEach(viewModel.estadio, id : \.self) {p in
                    Annotation(p.nomeEstadio, coordinate: CLLocationCoordinate2D(latitude: p.latitude, longitude: p.longitude)) {
                        Button(" "){
                            showingSheet.toggle()
                        }.sheet(isPresented: $showingSheet){
                            SheetView(image: p.foto, name: p.nomeEstadio, desc: p.donoDoEstadio)
                        };                            Image(systemName: "mappin.circle.fill")
                        Button(" "){
                            showingSheet.toggle()
                        }.sheet(isPresented: $showingSheet){
                            SheetView(image: p.foto , name: p.nomeEstadio, desc: p.donoDoEstadio)
                        }
                    }
                }
            };
            VStack{
                Picker("Picker name", selection: $selectedLoc) {
                    ForEach(self.viewModel.estadio, id: \.self){ p in
                        Text(p.nomeEstadio)
                    }
                }.onChange(of: selectedLoc){
                    position = MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: selectedLoc.latitude, longitude: selectedLoc.longitude),span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)))
                }
                Spacer()
                Text("Estádios do Brasil")
            }

        }.onAppear(){
            viewModel.fetch()

        }
    }
        
    
    }


#Preview {
    ContentView()
}
