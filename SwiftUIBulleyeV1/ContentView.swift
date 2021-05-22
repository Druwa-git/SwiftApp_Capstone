//
//  ContentView.swift
//  SwiftUIBulleyeV1
//
//  Created by 황동준 on 2021/05/05.
//  Copyright © 2021 황동준. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    //property
    //========
    
    // stage for User Interface views
    @State var alertIsVisible = false
    @State var sliderValue = 50.0
    @State var target = Int.random(in: 1...100)
    //Game stats
    @State var score = 0
    @State var round = 1
    
    var sliderValueRounded: Int {
        Int(self.sliderValue.rounded())
    }
    var sliderTargetDifference: Int {
        abs(self.sliderValueRounded - self.target)
    }
    var body: some View {
        VStack{
            Spacer()
            HStack {
                Text("Put the bull eye as close as you can do:")
                Text("\(self.target)")
            }
            Spacer()
            //Silder row
            //TODO: add view for the slider row here
            HStack {
                Text("1")
                Slider(value: self.$sliderValue, in: 1...100)
                Text("100")
            }
            Spacer()
            //button row
            Button(action: {
                print("Points awarded: \(self.pointsForCurrentRound())")
                self.alertIsVisible = true
            }) {
                Text("Hit me!")
            }
            //State for alert
            .alert(isPresented: self.$alertIsVisible){
                Alert(title: Text(alertTitle()),
                      message: Text(self.scoringMessage()),
                      dismissButton: .default(Text("Awesome!")){
                        self.startNewRound()
                    }
                )
            }
            Spacer()
            //score row
            // TODO: add view for the score, rounds, and start over and info button
            HStack {
                Button(action:{
                    self.startNewGame()
                }){
                    Text("Start over")
                }
                Spacer()
                Text("Score:")
                Text("\(self.score)")
                Spacer()
                Text("Round:")
                Text("\(self.round)")
                Spacer()
                Button(action:{}){
                    Text("Inform")
                }
            }.padding(.bottom, 20)
        }//end of vstack
    }// end of body
    
    //Methods
    func pointsForCurrentRound() -> Int {
        let maximumScore = 100
        let points: Int
        if sliderTargetDifference == 0 {
            points = 150
        } else if sliderTargetDifference == 1 {
            points = 150
        } else{
            points = maximumScore - sliderTargetDifference
        }
        return points
    }
    
    func scoringMessage() -> String {
        return "The slider's value is \(Int(self.sliderValueRounded)).\n" +
        "The target value is \(self.target).\n" +
        "You scored \(self.pointsForCurrentRound()) points this round."
    }
    
    func alertTitle() -> String {
        let title : String
        if sliderTargetDifference == 0 {
            title = "Perfect!"
        } else if sliderTargetDifference < 5 {
            title = "You almost had it!"
        } else if sliderTargetDifference <= 10 {
            title = "Not bad."
        } else {
            title = "Are you even trying?"
        }
        return title
    }
    
    func startNewGame() {
        score = 0
        round = 1
        self.resetSliderAndTarget()
    }
    
    func startNewRound() {
        self.score = self.score + self.pointsForCurrentRound()
        self.round += 1
        self.resetSliderAndTarget()
    }
    
    func resetSliderAndTarget() {
        self.sliderValue = 50
        self.target = Int.random(in: 1...100)
    }
}//end of struct


//Preview
//========
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
