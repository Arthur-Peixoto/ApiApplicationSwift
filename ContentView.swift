//
//  ContentView.swift
//  MapApplication
//
//  Created by Student04 on 18/10/23.
//
import Foundation
import MapKit
import SwiftUI



struct ContentView: View {
    struct Location: Identifiable{
        let id = UUID()
        let name: String
        let coordinate: CLLocationCoordinate2D
        let flag: String
        let description: String
    }
    
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.12), span: MKCoordinateSpan(latitudeDelta: 20, longitudeDelta: 20))
    
    @State var nomezinho : String = ""

    let locations = [
        Location(name: "Buckingham Palace", coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141),flag:"🏴‍☠️",description: "vasco"),
        Location(name: "Football Stadium of Cincinnati", coordinate: CLLocationCoordinate2D(latitude: 39.099605136326616, longitude: -84.50760186598276),flag:"🇲🇵",description: "o Estádio de Futebol de Cincinnati, ou Paul Brown Stadium, é um local moderno e bem equipado que desempenha um papel central na cultura esportiva da cidade. Ele oferece aos fãs e visitantes um ambiente confortável e agradável para assistir a jogos da NFL e outros eventos, ao mesmo tempo em que presta homenagem ao legado de Paul Brown no futebol."),
        Location(name: "Tower of Dublin", coordinate: CLLocationCoordinate2D(latitude: 53.342982152903794, longitude: -6.267364029824138),flag:"🇺🇳",description: "a Torre de Dublin é uma obra de arquitetura contemporânea que se destaca no cenário urbano da cidade, simbolizando a evolução de Dublin como uma metrópole moderna e vibrante, ao mesmo tempo em que mantém a sua herança cultural e histórica."),
        Location(name: "Gondar from Etiopia", coordinate: CLLocationCoordinate2D(latitude: 12.602634545422864, longitude: 37.452156275238465),flag:"🏳️‍⚧️",description: "Gondar é uma cidade etíope que combina história, cultura e beleza natural de uma maneira única. Seus palácios reais, igrejas antigas e cenários deslumbrantes fazem dela um destino imperdível para os amantes da história e da cultura, além de oferecer a oportunidade de experimentar a hospitalidade calorosa e a rica tradição da Etiópia."),
        Location(name: "São Januário", coordinate: CLLocationCoordinate2D(latitude:  -22.890472925889817, longitude: -43.22799978465865),flag:"🏳️‍🌈",description: "São Januário é um famoso estádio de futebol localizado na cidade do Rio de Janeiro, Brasil. Inaugurado em 1927, o estádio é a casa do Club de Regatas Vasco da Gama, um dos clubes de futebol mais tradicionais do país. A história do estádio está intimamente ligada à rica trajetória do Vasco da Gama e ao esporte no Brasil."),
    ]
    
    var body: some View {
        VStack(){
            Text("World Map").font(.largeTitle)
            Text(nomezinho)
        NavigationView {
            Map(coordinateRegion: $mapRegion, annotationItems: locations) { location in
                MapAnnotation(coordinate: location.coordinate) {
                    NavigationLink {
                        Text(location.name).font(.title)
                        Text(location.flag).font(.title2)
                        Text(location.description)
                    } label: {
                        Circle()
                            .stroke(.red, lineWidth: 3)
                            .frame(width: 20, height: 20)
                    }
                }
            }
        }.frame(width: 400,height: 660)
                ScrollView{
                    HStack(){
                        ForEach(0..<locations.endIndex){i in
                            Button(locations[i].name, action:{
                                nomezinho = locations[i].name
                                mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: locations[i].coordinate.latitude, longitude: locations[i].coordinate.longitude), span: MKCoordinateSpan(latitudeDelta: 20, longitudeDelta: 20))
                            } )
                        }.scaledToFit().background(.blue ).foregroundColor(.white).cornerRadius(15)
                    }
                }
            
    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
