//
//  ScoringView.swift
//  TrapTrackerAWv2 WatchKit Extension
//
//  Created by Doxie Davis on 5/12/22.
//

import SwiftUI

struct ScoringView: View {
    
    @StateObject var dataModel: DataModel
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    dataModel.doUndo()
                }, label: {
                    VStack {
                        Text("Undo")
                        Image(systemName: "arrow.uturn.backward")
                    }
                })
                .frame(width: 60)
                .font(.caption2)
                .background(.blue)
                .foregroundColor(.white)
                .clipShape(Capsule())
                Button(action: {
                    dataModel.hitScore = false
                    dataModel.countShot()
                    dataModel.lastShotHit = false
                }, label: {
                    Text("Miss")
                })
                .font(.title2)
                .background(Color(.red))
                .foregroundColor(.white)
                .clipShape(Capsule())
            }
            Spacer()
            HStack{
                Spacer()
                VStack {
                    Text("Pos")
                    Text("\(dataModel.posCount[dataModel.posLoc])")
                        .font(.title2)
                }
                Spacer()
                VStack {
                    Text("Score")
                    Text("\(dataModel.roundTotal)")
                        .font(.title2)
                }
                Spacer()
                VStack {
                    Text("Shots")
                    Text("\(dataModel.shotCount)")
                        .font(.title2)
                }
                Spacer()
            }
            
            ZStack {
                NavigationLink(
                    destination: DayView(dataModel: dataModel),
                    isActive: $dataModel.roundComplete,
                    label: {})
                .opacity(0.0)
                Button(action: {
                    dataModel.hitScore = true
                    dataModel.countShot()
                    dataModel.lastShotHit = true
                }, label: {
                    Text("Hit")
                })
                .font(.title)
                .background(Color(.green))
                .foregroundColor(.black)
                .clipShape(Capsule())
            }
            .navigationBarHidden(true)
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        return ScoringView(dataModel: DataModel())
    }
}

}
