//
//  ContentView.swift
//  Maps
//
//  Created by Turma02-10 on 16/09/25.
//

import SwiftUI
import MapKit

struct Location: Hashable{
    let id = UUID()
    var nome: String
    var foto: String
    var descricao: String
    var latitude1: Double
    var longitude1: Double

}

struct SheetView: View{
    @Environment(\.dismiss) var dismiss
    @State var image: String = ""
    @State var name: String = ""
    @State var desc: String = ""
    var body: some View{
        ZStack{
            Rectangle().fill(.yellow).ignoresSafeArea()
            VStack{
                ZStack{
                    Rectangle().fill(.yellow).border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/).frame(width:300,height:300)
                    AsyncImage(url: URL(string: image )){image in
                        image.resizable()
                    }placeholder: {
                        ProgressView()
                    }.frame(width: 200, height: 200)
                }
                Text(name).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                ZStack{
                    Rectangle().fill(.brown).frame(width: 200, height: 200)
                    VStack{
                        Text(desc)
                    }
                }
            }
         
        }
    }
}

struct ContentView: View {
    @State private var showingSheet = false
    let annotations = [
        Location(nome: "São Januário", foto: "https://assets.goal.com/images/v3/bltd469a213efca6498/d28dec43d8f0cc783a6175a265ec4fc25a03aea1.jpg", descricao: "Estádio mais bonito do Brasil",latitude1: -22.8879, longitude1: -43.2236), Location(nome: "Allianz Parque", foto: "https://vejasp.abril.com.br/wp-content/uploads/2021/05/casacor-sao-paulo-2021-nova-sede-allianz-parque-5.jpg?crop=1&resize=1212,909", descricao: "Estádio do Palmeiras",latitude1: -23.5231979072, longitude1:  -46.6737139718), Location(nome: "Arena da Baixada", foto: "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/26/04/4a/13/iluminacao-noturna-da.jpg?w=900&h=500&s=1", descricao: "Estádio do Athletico", latitude1: -25.4423, longitude1: -49.2728)
    ]
    @State private var selectedPoint = ""
    @State private var position =
    MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -14.2350, longitude: -51.9253),span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)))
    @State private var selectedLoc = Location(nome: "", foto:"", descricao: "", latitude1: 0.0, longitude1: 0.0)

    var body: some View {
            ZStack{
                
                Map(position: $position) {
                    ForEach(annotations, id : \.self) {p in
                        Annotation(p.nome, coordinate: CLLocationCoordinate2D(latitude: p.latitude1, longitude: p.longitude1)) {
                            Button(" "){
                                showingSheet.toggle()
                            }.sheet(isPresented: $showingSheet){
                                SheetView(image: p.foto, name: p.nome, desc: p.descricao)
                            };                            Image(systemName: "mappin.circle.fill")
                            Button(" "){
                                showingSheet.toggle()
                            }.sheet(isPresented: $showingSheet){
                                SheetView(image: p.foto , name: p.nome, desc: p.descricao)
                            }
                        }
                    }
                };        
                VStack{
                    Picker("Picker name", selection: $selectedLoc) {
                        ForEach(self.annotations, id: \.self){ p in
                            Text(p.nome)
                        }
                    }.onChange(of: selectedLoc){
                        position = MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: selectedLoc.latitude1, longitude: selectedLoc.longitude1),span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)))
                    }
                    Spacer()
                    Text("Estádios do Brasil")
                }

                }
            }
            
        
    }


#Preview {
    ContentView()
}
