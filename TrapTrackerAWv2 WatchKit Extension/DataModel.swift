//
//  DataModel.swift
//  TrapTrackerAWv2 WatchKit Extension
//
//  Created by Doxie Davis on 5/12/22.
//

import Foundation
import SwiftUI
import ClockKit

class DataModel: ObservableObject {
        
    @Published var allRnds = [[Int]]()
    @Published var shotCount: Int = 0
    @Published var totScore: Int  = 0
    @Published var hitScore: Bool = false
    @Published var lastShotHit = false
    @Published var posCount: [Int]  = [0, 0, 0, 0, 0, 0]
    @Published var roundTotal: Int  = 0
    @Published var posLoc: Int  = 0
    @Published var posSelected: Bool  = false
    @Published var roundComplete: Bool  = false
    @Published var pos1Tot: Int   = 0
    @Published var pos2Tot: Int   = 0
    @Published var pos3Tot: Int   = 0
    @Published var pos4Tot: Int   = 0
    @Published var pos5Tot: Int   = 0
    @Published var totTot: Int   = 0
    @Published var pos1Avg: Double = 0.0
    @Published var pos2Avg: Double = 0.0
    @Published var pos3Avg: Double = 0.0
    @Published var pos4Avg: Double = 0.0
    @Published var pos5Avg: Double = 0.0
    @Published var totAvg: Double = 0.0
    @Published var totRnds: Int = 0
    
    func countShot () {
        if hitScore == true {
            roundTotal += 1
            posCount[posLoc] += 1
        }
        shotCount += 1
        roundComplete = false
        lastShotHit = false
        if shotCount == 25 {
            posCount[5] = roundTotal
            totRnds += 1
            allRnds.append(posCount)
            calcAvgs()
            roundComplete = true
        } else
        if shotCount == 5 || shotCount == 10 || shotCount == 15 ||  shotCount == 20 {
            posLoc += 1
        }
        if posLoc == 5 {
            posLoc = 0
        }
        hitScore = false
    }
    
    func doUndo () {
        if shotCount == 0 {
            return
        }
        if lastShotHit == true {
            roundTotal -= 1
            posCount[posLoc] -= 1
        } else {
            roundTotal += 1
            posCount[posLoc] += 1
        }
        lastShotHit.toggle()
    }
    
    func clearData () {
        shotCount = 0
        totScore = 0
        hitScore = false
        posCount = [0, 0, 0, 0, 0, 0]
        roundTotal = 0
        roundComplete = false
        posSelected = false
    }
    
    func calcAvgs () {
        for _ in 0...allRnds.count {
            pos1Avg = Double(allRnds.reduce(0, {$0 + $1[0]}))/Double(allRnds.count)
            pos2Avg = Double(allRnds.reduce(0, {$0 + $1[1]}))/Double(allRnds.count)
            pos3Avg = Double(allRnds.reduce(0, {$0 + $1[2]}))/Double(allRnds.count)
            pos4Avg = Double(allRnds.reduce(0, {$0 + $1[3]}))/Double(allRnds.count)
            pos5Avg = Double(allRnds.reduce(0, {$0 + $1[4]}))/Double(allRnds.count)
            totAvg = Double(allRnds.reduce(0, {$0 + $1[5]}))/Double(allRnds.count)
        }
        totRnds = allRnds.count
        if totRnds == 0 {
            pos1Avg = 0
            pos2Avg = 0
            pos3Avg = 0
            pos4Avg = 0
            pos5Avg = 0
            totAvg = 0
        }
    }
}

