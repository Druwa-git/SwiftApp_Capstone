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
    
    //colors
    let midnightBlue = Color(red: 0, green: 0.2, blue: 0.4)
    
    // stage for User Interface views
    @State var alertIsVisible = false
    @State var sliderValue = 50.0
    @State var target = Int.random(in: 1...100)
    //Game stats
    @State var score = 0
    @State var round = 1
    
    var sliderValueRounded: Int {
        Int(sliderValue.rounded())
    }
    var sliderTargetDifference: Int {
        abs(sliderValueRounded - target)
    }
    var body: some View {
        NavigationView {
            VStack{
                Spacer().navigationBarTitle(" ◎ Bullseye ◎ ")
                HStack {
                    Text("Put the bull eye as close as you can do:")
                        .modifier(LableStyle())
                    Text("\(self.target)")
                        .modifier(ValueStyle())
                }
                Spacer()
                //Silder row
                //TODO: add view for the slider row here
                HStack {
                    Text("1")
                    .modifier(LableStyle())
                    Slider(value: self.$sliderValue, in: 1...100)
                        .accentColor(Color.green)
                        .animation(.easeOut)
                    Text("100")
                    .modifier(LableStyle())
                }
                Spacer()
                //button row
                Button(action: {
                    print("Points awarded: \(self.pointsForCurrentRound())")
                    self.alertIsVisible = true
                }) {
                    Text("Hit me!")
                    .modifier(ButtonLargeTextStyle())
                }
                .background(Image("Button"))
                .modifier(Shadow())
                //State for alert
                .alert(isPresented: self.$alertIsVisible){
                    Alert(title: Text(alertTitle()),
                          message: Text(scoringMessage()),
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
                        HStack{
                            Image("StartOverIcon")
                            Text("Start over")
                                .modifier(ButtonSmallTextStyle())
                        }
                    }
                    .background(Image("Button"))
                    .modifier(Shadow())
                    
                    Spacer()
                    Text("Score:")
                        .modifier(LableStyle())
                    Text("\(score)")
                    .modifier(ValueStyle())
                    Spacer()
                    Text("Round:")
                    .modifier(LableStyle())
                    Text("\(round)")
                    .modifier(ValueStyle())
                    Spacer()
                    //Button(action:{})
                    NavigationLink(destination: AboutView()){
                        HStack{
                            Image("InfoIcon")
                            Text("Inform")
                                .modifier(ButtonSmallTextStyle())
                        }
                    }
                    .background(Image("Button"))
                    .modifier(Shadow())
                }.padding(.bottom, 20)
                .accentColor(midnightBlue)
            }//end of vstack
                .onAppear() { self.startNewGame() }
            .background(Image("Background"))
        } //End of Navigation View
        .navigationViewStyle(StackNavigationViewStyle())
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
        return "The slider's value is \(Int(sliderValueRounded)).\n" +
        "The target value is \(target).\n" +
        "You scored \(pointsForCurrentRound()) points this round."
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
        resetSliderAndTarget()
    }
    
    func startNewRound() {
        score = score + pointsForCurrentRound()
        round += 1
        resetSliderAndTarget()
    }
    
    func resetSliderAndTarget() {
        sliderValue = Double.random(in: 1...100)
        target = Int.random(in: 1...100)
    }
}//end of struct
// View Modifier
struct LableStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
        .font(Font.custom("Arial Rounded MT Bold",size: 18))
        .foregroundColor(Color.white)
        .modifier(Shadow())
    }
}
struct ValueStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
        .font(Font.custom("Arial Rounded MT Bold",size: 24))
        .foregroundColor(Color.white)
        .modifier(Shadow())
    }
}

//Shadow
struct Shadow: ViewModifier {
    func body(content: Content) -> some View {
        content
        .shadow(color: Color.black, radius: 5, x:2, y:2)
    }
}

//for the Hit me! Button
struct ButtonLargeTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
        .font(Font.custom("Arial Rounded MT Bold", size: 18))
        .foregroundColor(Color.black)
    }
}
struct ButtonSmallTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
        .font(Font.custom("Arial Rounded MT Bold", size: 12))
        .foregroundColor(Color.black)
    }
}

//Preview
//========
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
