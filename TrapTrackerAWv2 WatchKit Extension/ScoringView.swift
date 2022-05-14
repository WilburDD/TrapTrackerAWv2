//
//  ScoringView.swift
//  TrapTrackerAWv2 WatchKit Extension
//
//  Created by Doxie Davis on 5/12/22.
//

import SwiftUI

struct ScoringView: View {
    
    @StateObject var dataModel: DataModel
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack (spacing: 0) {
            HStack {
                Button(action: {
                    if dataModel.shotCount == 0 {
                        dataModel.roundComplete = true
                    } else {
                        dataModel.showAlert = true
                    }
                }, label: {
                    Image(systemName: "chevron.backward")
                })
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                Spacer()
                    .alert(isPresented: $dataModel.showAlert, content: {
                        Alert(
                            title: Text("WARNING"),
                            message: Text("Exit during scoring will delete this round's data."),
                            primaryButton:
                                    .cancel(Text("Continue Scoring")),
                            secondaryButton: .destructive(Text("Exit"), action: {
                                dataModel.clearData()
                                dismiss()
                            }))
                    })
            }
            .ignoresSafeArea()
            .padding(0)
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
                        .font(.title)
                }
                Spacer()
                VStack {
                    Text("Score")
                    Text("\(dataModel.roundTotal)")
                        .font(.title)
                }
                Spacer()
                VStack {
                    Text("Shots")
                    Text("\(dataModel.shotCount)")
                        .font(.title)
                }
                Spacer()
            }
            Spacer()
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
                .font(.title2)
                .background(Color(.green))
                .foregroundColor(.black)
                .clipShape(Capsule())
            }
        }
        .navigationBarHidden(true)
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        return ScoringView(dataModel: DataModel())
    }
}

}
