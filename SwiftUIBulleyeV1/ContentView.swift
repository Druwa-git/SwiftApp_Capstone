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
    @State var alertIsVisible: Bool = false
    @State var sliderValue: Double = 50.0
    var body: some View {
        VStack{
            Spacer()
            HStack {
                Text("Put the bull eye as close as you can do:")
                Text("100")
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
                print("Button pressed")
                self.alertIsVisible = true
            }) {
                Text("Hit me!")
            }
            //State for alert
            .alert(isPresented: self.$alertIsVisible){
                Alert(title: Text("Hello there!"),
                      message: Text("The slider's value is \(Int(self.sliderValue.rounded()))."),
                      dismissButton: .default(Text("Awesome!")))
            }
            Spacer()
            //score row
            // TODO: add view for the score, rounds, and start over and info button
            HStack {
                Button(action:{}){
                    Text("Start over")
                }
                Spacer()
                Text("Score:")
                Text("999999")
                Spacer()
                Text("Round:")
                Text("999")
                Spacer()
                Button(action:{}){
                    Text("Inform")
                }
            }.padding(.bottom, 20)
        }//end of vstack
    }// end of body
    
    //Methods
    
}//end of struct


//Preview
//========
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
