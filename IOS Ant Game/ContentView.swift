//
//  ContentView.swift
//  IOS Ant Game
//
//  Created by Md. Masum  on 1/2/22.
//

import SwiftUI

struct ContentView: View {
    @State private var offset : CGFloat = 40
    @State private var offset2 : CGFloat = 0.0
    @State private var point = 100
    @State private var count1 = 0
    @State private var count2 = 0
    
    @State private var offset3 : CGFloat = -650.0
    var body: some View {
        ZStack{
            Image("background").ignoresSafeArea()
            
            HStack{
                
                //Text("X").font(Font.system(size: 30.0)).offset(x: 50.0)
                VStack{
                    Spacer() // star
                    Image("car2").resizable().frame(width: 80, height: 170).offset( y: offset3).animation(Animation.easeInOut(duration: 2.0), value: offset).shadow(radius: 10.0)
                    //car
                    Image("car").resizable().frame(width: 110, height: 190)/*(systemName: "ant").font(Font.system(size: 100.0))*/.offset(x:offset, y:-40.0)
                        .shadow(radius: 10.0)
                        /*.onTapGesture {
                            offset -= 100.0
                            if(offset == offset2){
                                point += 5
                            }
                        }*/
                        .animation(Animation.easeInOut(duration: 1.0), value: offset)
                    
                }
                VStack{
                    Image("speedmeter").resizable().frame(width: 65, height: 65)
                    Button {
                        offset = 40.0
                        point = 100
                        offset3 = -650.0
                    } label: {
                        Text("Refresh").bold().padding(5).foregroundColor(Color.white).background(.blue).cornerRadius(25)
                    }
                    HStack{
                        Button{ // left handle btn
                            offset -= 60.0 // for the car
                            
                            if(offset < -40.0){
                                point -= 5
                            }
                        }label: {
                            Text("<-").bold().padding(5).foregroundColor(Color.white).background(.red).cornerRadius(25)
                        }
                        
                        Button{
                            offset += 60.0 // right handle btn
                            count2 += 1
                            if(count2%2 == 0 ){
                                offset3 = 350 // for star
                                if(offset < -20.0) {
                                    point -= 5
                                }
                            }
                            else if(count2%5 == 0){
                                offset3 = -650.0 // reset the star position
                            }
                            if(offset > 100.0){
                                point -= 5
                            }
                        }label: {
                            Text("->").bold().padding(5).foregroundColor(Color.white).background(.red).cornerRadius(25)
                        }
                    }
                    Text("Points:").foregroundColor(.white)
                    Text(String(point)).foregroundColor(.white).font(.system(size: 35))
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
