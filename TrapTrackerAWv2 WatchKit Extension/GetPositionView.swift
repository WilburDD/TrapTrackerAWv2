//
//  GetPositionView.swift
//  TrapTrackerAWv2 WatchKit Extension
//
//  Created by Doxie Davis on 5/12/22.
//

import SwiftUI

struct GetPositionView: View {
    
    @StateObject var dataModel: DataModel
    
    var body: some View {
        
        ZStack {
            NavigationLink(
                destination: ScoringView(dataModel: dataModel),
                isActive: $dataModel.posSelected,
                label: {})
            .opacity(0.0)
            VStack {
                Text ("Starting position?")
                    .font(.title3)
                    .fontWeight(.bold)
                    .italic()
                    .padding(.bottom, 10)
                VStack {
                    HStack {
                        Button(action: {
                            dataModel.posLoc = 0
                            dataModel.roundComplete = false
                            dataModel.posSelected = true
                        }, label: {
                            Text("1").font(.title2)
                        })
                        .getPosButtonStyle()
                        Spacer()
                        Button(action: {
                            dataModel.posLoc = 4
                            dataModel.roundComplete = false
                            dataModel.posSelected = true
                        }, label: {
                            Text("5").font(.title2)
                        })
                        .getPosButtonStyle()
                    }
                    HStack {
                        Spacer()
                        Button(action: {
                            dataModel.posLoc = 1
                            dataModel.roundComplete = false
                            dataModel.posSelected = true
                        }, label: {
                            Text("2").font(.title2)
                        })
                        .getPosButtonStyle()
                        Spacer()
                        Button(action: {
                            dataModel.posLoc = 3
                            dataModel.roundComplete = false
                            dataModel.posSelected = true
                        }, label: {
                            Text("4").font(.title2)
                        })
                        .getPosButtonStyle()
                        Spacer()
                    }
                    Button(action: {
                        dataModel.posLoc = 2
                        dataModel.roundComplete = false
                        dataModel.posSelected = true
                    }, label: {
                        Text("3").font(.title2)
                    })
                    .getPosButtonStyle()
                }
            }
        }
        
    }
}

extension Button {
    func getPosButtonStyle() -> some View {
        self
            .frame(width: 40, height: 40)
            .foregroundColor(.black)
            .background(Color(.green))
            .clipShape(Circle())
    }
}

struct GetPositionView_Previews: PreviewProvider {
    static var previews: some View {
        GetPositionView(dataModel: DataModel())
    }
}

