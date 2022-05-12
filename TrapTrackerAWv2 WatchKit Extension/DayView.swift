//
//  ContentView.swift
//  TrapTrackerAWv2 WatchKit Extension
//
//  Created by Doxie Davis on 5/12/22.
//

import SwiftUI

struct DayView: View {
    
    @StateObject var dataModel: DataModel
    
    var body: some View {
        VStack (spacing: 0){
            Spacer()
            Text("Rounds:  \(dataModel.totRnds)")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title3)
            Spacer()
            HStack {
                Text("Avg.")
                    .font(.title2)
                Spacer()
                Text("\(dataModel.totAvg, specifier: "%.1f")")
                    .font(.title)
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .clipShape(Rectangle())
            HStack {
                Text("\(dataModel.pos1Avg, specifier: "%.1f")")
                    .font(.system(size: 22))
                Spacer()
                Text("\(dataModel.pos2Avg, specifier: "%.1f")")
                    .font(.system(size: 22))
                Spacer()
                Text("\(dataModel.pos3Avg, specifier: "%.1f")")
                    .font(.system(size: 22))
                Spacer()
                Text("\(dataModel.pos4Avg, specifier: "%.1f")")
                    .font(.system(size: 22))
                Spacer()
                Text("\(dataModel.pos5Avg, specifier: "%.1f")")
                    .font(.system(size: 22))
            }
            Spacer()
            Spacer()
            NavigationLink(destination: GetPositionView(dataModel: dataModel)) {
                Text("New Round")
                    .frame(maxWidth: .infinity, minHeight: 40)
                    .font(.title3)
                    .background(Color(.green))
                    .foregroundColor(.black)
                    .clipShape(Capsule())
            }
            .simultaneousGesture(TapGesture().onEnded {
                dataModel.clearData()
            })
            .navigationBarHidden(true)
        }
    }
        
        struct SwiftUIView_Previews: PreviewProvider {
            static var previews: some View {
                DayView(dataModel: DataModel())
            }
        }
    
}
