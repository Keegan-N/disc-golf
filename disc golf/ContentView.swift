//
//  ContentView.swift
//  disc golf
//
//  Created by Norgard, Keegan - Student on 10/10/24.
//

import SwiftUI
import MapKit


struct ContentView: View {
    var distances: [Int] = [318,480,308,415,449,294,426,358,404,339,276,387,322,403,415,408,614,386]
    var starts: [CLLocationCoordinate2D] = [
        CLLocationCoordinate2D(latitude: 40.556722, longitude: -105.138361),
        CLLocationCoordinate2D(latitude: 40.556446, longitude: -105.139092),
        CLLocationCoordinate2D(latitude: 40.556677, longitude: -105.137562),
        CLLocationCoordinate2D(latitude: 40.557198, longitude: -105.135832),
        CLLocationCoordinate2D(latitude: 40.557539, longitude: -105.135469),
        CLLocationCoordinate2D(latitude: 40.557769, longitude: -105.137073),
        CLLocationCoordinate2D(latitude: 40.557700, longitude: -105.135268),
        CLLocationCoordinate2D(latitude: 40.557813, longitude: -105.134546),
        CLLocationCoordinate2D(latitude: 40.558342, longitude: -105.136262),
        CLLocationCoordinate2D(latitude: 40.558855, longitude: -105.137067),//
        CLLocationCoordinate2D(latitude: 40.558360, longitude: -105.135468),
        CLLocationCoordinate2D(latitude: 40.558385, longitude: -105.134161),
        CLLocationCoordinate2D(latitude: 40.559369, longitude: -105.134150),
        CLLocationCoordinate2D(latitude: 40.558915, longitude: -105.135949),
        CLLocationCoordinate2D(latitude: 40.559693, longitude: -105.135523),
        CLLocationCoordinate2D(latitude: 40.560616, longitude: -105.134974),
        CLLocationCoordinate2D(latitude: 40.560541, longitude: -105.136819),
        CLLocationCoordinate2D(latitude: 40.558855, longitude: -105.137067),//
        CLLocationCoordinate2D(latitude: 40.558351, longitude: -105.139451)]
    var holes: [CLLocationCoordinate2D] = [
        CLLocationCoordinate2D(latitude: 40.556722, longitude: -105.138361),
        CLLocationCoordinate2D(latitude: 40.556555, longitude: -105.137958),
        CLLocationCoordinate2D(latitude: 40.557332, longitude: -105.136067),
        CLLocationCoordinate2D(latitude: 40.557061, longitude: -105.134752),
        CLLocationCoordinate2D(latitude: 40.557462, longitude: -105.136964),
        CLLocationCoordinate2D(latitude: 40.557887, longitude: -105.135464),
        CLLocationCoordinate2D(latitude: 40.557531, longitude: -105.134228),
        CLLocationCoordinate2D(latitude: 40.558382, longitude: -105.135884),
        CLLocationCoordinate2D(latitude: 40.558451, longitude: -105.137545),
        CLLocationCoordinate2D(latitude: 40.558582, longitude: -105.135650),
        CLLocationCoordinate2D(latitude: 40.558085, longitude: -105.134316),
        CLLocationCoordinate2D(latitude: 40.559123, longitude: -105.134389),
        CLLocationCoordinate2D(latitude: 40.559024, longitude: -105.135460),
        CLLocationCoordinate2D(latitude: 40.559783, longitude: -105.135800),
        CLLocationCoordinate2D(latitude: 40.560467, longitude: -105.134481),
        CLLocationCoordinate2D(latitude: 40.560336, longitude: -105.136423),
        CLLocationCoordinate2D(latitude: 40.559437, longitude: -105.137056),
        CLLocationCoordinate2D(latitude: 40.558589, longitude: -105.139184),
        CLLocationCoordinate2D(latitude: 40.557292, longitude: -105.139471)]
    var midpoints: [CLLocationCoordinate2D] = [
        CLLocationCoordinate2D(latitude: 40.556722, longitude: -105.138361),
        CLLocationCoordinate2D(latitude: 40.5565005, longitude: -105.138525),
        CLLocationCoordinate2D(latitude: 40.557004500000005,longitude: -105.1368145),
        CLLocationCoordinate2D(latitude: 40.5571295, longitude: -105.13529199999999),
        CLLocationCoordinate2D(latitude: 40.5575005,longitude: -105.1362165),
        CLLocationCoordinate2D(latitude: 40.557828, longitude: -105.1362685),
        CLLocationCoordinate2D(latitude: 40.5576155,longitude: -105.134748),
        CLLocationCoordinate2D(latitude: 40.5580975, longitude: -105.135215),
        CLLocationCoordinate2D(latitude: 40.5583965,longitude: -105.1369035),
        CLLocationCoordinate2D(latitude: 40.5587185, longitude: -105.1363585),
        CLLocationCoordinate2D(latitude: 40.5582225,longitude: -105.13489200000001),
        CLLocationCoordinate2D(latitude: 40.558754, longitude: -105.134275),
        CLLocationCoordinate2D(latitude: 40.5591965,longitude: -105.134805),
        CLLocationCoordinate2D(latitude: 40.559349, longitude: -105.1358745),
        CLLocationCoordinate2D(latitude: 40.56008,longitude: -105.135002),
        CLLocationCoordinate2D(latitude: 40.560476, longitude: -105.13569849999999),
        CLLocationCoordinate2D(latitude: 40.559989,longitude: -105.1369375),
        CLLocationCoordinate2D(latitude: 40.558722, longitude: -105.1381255),
        CLLocationCoordinate2D(latitude: 40.5578215, longitude: -105.139461)]
    @State var player1Score: [Int:Int] = [:]
    @State var player2Score: [Int:Int] = [:]
    @State var player3Score: [Int:Int] = [:]
    @State var player4Score: [Int:Int] = [:]
    @State var playerCount = 1
    @State var rectangleHeight: CGFloat = 90
    @State var currentPlayer = 1
    @State var currentScore = 1
    @State var currentHole = 0
    @State private var camera: MapCameraPosition = .automatic
    var body: some View {
        HStack(spacing: 0){
            Rectangle()
                
                .frame(width: 300,height: 800)
                .offset(y: 9.5)
                .overlay{
                    VStack(spacing: 7.5){
                        Spacer()
                        Text("Aggie Greens")
                            .foregroundStyle(.white)
                            .font(.system(size: 35))
                        Text("Disc Golf Course")
                            .foregroundStyle(.white)
                            .font(.system(size: 35))
                        Spacer()
                        HStack{
                            Spacer()
                            Button{
                                if(currentHole > 0){
                                    currentHole -= 1
                                }
                            }label: {
                                Text("Back")
                                    .foregroundStyle(.black)
                                    .padding(5)
                                    .background(.white,in: RoundedRectangle(cornerRadius: 5))
                            }
                            Spacer()
                            Text("current hole \(currentHole)")
                                .foregroundStyle(.white)
                                .bold()
                            Spacer()
                            Button{
                                if(currentHole < 18){
                                    currentHole += 1
                                    currentPlayer = 1
                                }
                            }label: {
                                Text("Next")
                                    .foregroundStyle(.black)
                                    .padding(5)
                                    .background(.white,in: RoundedRectangle(cornerRadius: 5))
                            }
                            Spacer()
                        }
                        .onChange(of: currentHole) { oldValue, newValue in
                            
                            if(currentHole != 0){
                                camera = .region(MKCoordinateRegion(center: midpoints[currentHole], latitudinalMeters: 200, longitudinalMeters: 200))
                                currentHole = currentHole
                            } else {
                                camera = .region(MKCoordinateRegion(center: midpoints[currentHole], latitudinalMeters: 250, longitudinalMeters: 250))
                            }
                        }
                        Spacer()
                        HStack(){
                            Spacer()
                            Button{
                                if(playerCount < 4){
                                    playerCount += 1
                                }
                            } label: {
                                Text("add player")
                                    .foregroundStyle(.black)
                                    .padding(5)
                                    .background(.white,in: RoundedRectangle(cornerRadius: 5))
                            }
                            Spacer()
                            Button{
                                if(playerCount > 1){
                                    playerCount -= 1
                                }
                            } label: {
                                Text("remove player")
                                    .foregroundStyle(.black)
                                    .padding(5)
                                    .background(.white,in: RoundedRectangle(cornerRadius: 5))
                            }
                            Spacer()
                        }
                        Spacer()
                        ForEach(1...distances.count , id: \.self) { distance in
                            Text("hole \(distance): distance \(distances[distance - 1]) ft: par 3")
                                .foregroundStyle(.white)
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                        }
                        Spacer()
                            .frame(height: 5)
                    }
                }
            VStack(spacing: 0){
                Rectangle()
                    .frame(height: rectangleHeight)
                    .foregroundStyle(.white)
                    .overlay{
                        Rectangle()
                            .stroke(lineWidth: 5)
                            .frame(height: rectangleHeight)
                            
                    }
                    .overlay{
                        VStack(spacing: 5){
                            HStack(spacing: 9.75){
                                
                                Spacer()
                                    .frame(width: 55)
                                ForEach(1...holes.count - 1, id: \.self) { item in
                                    Text("hole \(item)")
                                        .font(.system(size: 10))
                                        .frame(width: 35)
                                }
                            }
                            .frame(height: 15)
                            ScoreTable(score: player1Score, count: playerCount, text: "player 1")
                            if(playerCount > 1){
                                ScoreTable(score: player2Score, count: playerCount, text: "player 2")
                            }
                            if(playerCount > 2){
                                ScoreTable(score: player3Score, count: playerCount, text: "player 3")
                            }
                            if(playerCount > 3){
                                ScoreTable(score: player4Score, count: playerCount, text: "player 4")
                            }
                            HStack{
                                Spacer()
                                Button {
                                    recordScore()
                                }label: {
                                    Text("record")
                                        .padding(5)
                                        .foregroundStyle(.white)
                                        .background(.black,in: RoundedRectangle(cornerRadius: 5))
                                }
                                Spacer()
                                Text("player \(currentPlayer)")
                                Stepper("", value: $currentPlayer)
                                    .frame(width:100)
                                    .onChange(of: currentPlayer) {
                                        if(currentPlayer > playerCount){
                                            currentPlayer = playerCount
                                        }
                                        if(currentPlayer < 1){
                                            currentPlayer = 1
                                        }
                                    }
                                Spacer()
                                Text("hole \(currentHole)")
                                Stepper("", value: $currentHole)
                                    .frame(width:100)
                                    .onChange(of: currentHole) {
                                        if(currentHole > 18){
                                            currentHole = 18
                                        }
                                        if(currentHole < 0){
                                            currentHole = 0
                                        }
                                    }
                                Spacer()
                                Text("score \(currentScore)")
                                
                                    .onChange(of: currentScore) {
                                        if(currentScore > 99){
                                            currentScore = 99
                                        }
                                        if(currentScore < 1){
                                            currentScore = 1
                                        }
                                    }
                                Stepper("", value: $currentScore)
                                    .frame(width:100)
                                Spacer()
                                
                            }
                            
                            .frame(height: 40)
                        }
                        
                        .onChange(of: playerCount) { oldValue, newValue in
                            if(oldValue > newValue){
                                rectangleHeight -= 30
                            } else {
                                rectangleHeight += 30
                            }
                        }
                    }
                Map(position: $camera){
                    ForEach(1..<holes.count , id: \.self) { i in
                        if(currentHole == i){
                            Marker("GOAL \(i)",coordinate: holes[i])
                            if(i != 9 && i != 17){
                                Marker("START \(i)",coordinate: starts[i])
                            } else {
                                Marker("STARTS 9 & 17" , coordinate: starts[9])
                            }
                        }else {
                            Marker("goal \(i)",coordinate: holes[i])
                            if(i != 9 && i != 17){
                                Marker("start \(i)",coordinate: starts[i])
                            } else {
                                Marker("starts 9 & 17" , coordinate: starts[9])
                            }
                        }
                        
                    }
                    
                }
                
                
                    .mapStyle(.imagery)
                    .onAppear(){
                        camera = .region(MKCoordinateRegion(center: starts[0], latitudinalMeters: 250, longitudinalMeters: 250))
                    }
            }
        }
    }
    func recordScore(){
        if(currentPlayer == 1){
            player1Score[currentHole] = currentScore
        }
        if(currentPlayer == 2){
            player2Score[currentHole] = currentScore
        }
        if(currentPlayer == 3){
            player3Score[currentHole] = currentScore
        }
        if(currentPlayer == 4){
            currentPlayer = 1
            player4Score[currentHole] = currentScore
        }else if(currentPlayer == 1 && playerCount > 1){
            currentPlayer = 2
        } else if(currentPlayer == 2 && playerCount > 2){
            currentPlayer = 3
        } else if (currentPlayer == 2){
            currentPlayer = 1
        } else if(currentPlayer == 3 && playerCount > 3){
            currentPlayer = 4
        } else if (playerCount == 3){
            currentPlayer = 1
        }
    }
 
}

struct ScoreTable: View {
    
    var score: [Int:Int]
    var count: Int
    var text: String
    var body: some View{
        HStack(spacing: 0){
            Text(text)
                .frame(width: 70)
            ForEach(1...18, id: \.self) { item in
                
                Rectangle()
                    .stroke()
                    .overlay{
                        VStack{
                            if let name = score[item] {
                                if(name == 3){
                                    Text("\(name)")
                                        .foregroundStyle(.green)
                                }
                                if(name > 3){
                                    Text("\(name)")
                                        .foregroundStyle(.red)
                                }
                                    if(name < 3){
                                        Text("\(name)")
                                            .foregroundStyle(.blue)
                                }
                                
                            } else {
                                Text("N\\A")
                            }
                        }
                    }
            }
            Spacer()
                .frame(width: 5)
        }
        
    }
    
}

#Preview {
    ContentView()
}
