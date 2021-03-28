//
//  AstronautView.swift
//  Moonshot
//
//  Created by Erik Mikac on 3/25/21.
//

import SwiftUI

struct AstronautView: View {
    var astronaut: Astronaut
    var astronaughtsMissions = [Mission]()
    var body: some View {
        GeometryReader {
            geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(self.astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width)
                    Text(self.astronaut.description)
                        .padding()
                        .layoutPriority(1)
                    
                    Text("\(astronaut.name)'s Missions")
                        .padding()
                        .font(.headline)
                    List(self.astronaughtsMissions) {mission in
                        Text("Mission: \(mission.displayName)")
                        Text("Date: \(mission.formattedLaunchDate)")
                            
                        
                    }
                }
            }
        }
        .navigationBarTitle(Text(astronaut.name))
    }
    
    init(astronaut: Astronaut, missions: [Mission]) {
        self.astronaut = astronaut
        for mission in missions {
            for member in mission.crew {
                print("Members name: \(member.name), astronauts name: \(astronaut.id)")
                if(member.name == astronaut.id) {
                    astronaughtsMissions.append(mission)
                    break
                }
            }
        }
        print(astronaughtsMissions)
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    static let missons: [Mission] = Bundle.main.decode("missions.json")
    static var previews: some View {
        AstronautView(astronaut: astronauts[0], missions: missons)
    }
}
