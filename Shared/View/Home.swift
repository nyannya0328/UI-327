//
//  Home.swift
//  UI-327 (iOS)
//
//  Created by nyannyan0328 on 2021/10/12.
//

import SwiftUI

struct Home: View {
    let maxHeight : CGFloat = UIScreen.main.bounds.height / 3
    
    @State var slederProgress : CGFloat = 0
    
    @State var slederHeight : CGFloat = 0
    
    @State var lastDragValue : CGFloat = 0
    var body: some View {
        NavigationView{
            
            VStack{
                
                ZStack(alignment: .bottom) {
                    
                    Rectangle()
                        .fill(Color("slider").opacity(0.15))
                    
                    Rectangle()
                        .fill(Color("slider"))
                        .frame(height: slederHeight)
                    
                    
                }
                .frame(width: 100, height: maxHeight)
                .cornerRadius(35)
                .overlay(
                
                Text("\(Int(slederProgress * 100))%")
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .padding(.vertical,10)
                    .padding(.horizontal,18)
                    .background(Color.white.cornerRadius(10))
                    .padding(.vertical,30)//little above
                    .offset(y: slederHeight < maxHeight - 105 ? -slederHeight : -maxHeight + 105)
                    
                
                
                ,alignment: .bottom
                
                
                )
                .gesture(
                
                    DragGesture().onChanged({ value in
                        
                        
                        let translation = value.translation
                        
                        slederHeight = -translation.height + lastDragValue
                        
                        slederHeight = slederHeight > maxHeight ? maxHeight : slederHeight
                        
                        
                        slederHeight = slederHeight >= 0 ? slederHeight : 0
                        
                        
                   let progress = slederHeight / maxHeight
                        
                        slederProgress = progress <= 1 ? progress : 1
                        
                    })
                        .onEnded({ value in
                            
                            slederHeight = slederHeight > maxHeight ? maxHeight : slederHeight
                            
                            slederHeight = slederHeight >= 0 ? slederHeight : 0
                            
                            lastDragValue = slederHeight
                            
                        })
                )
               
                
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("bg").ignoresSafeArea())
            .navigationTitle("Dash Board")
            
            
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
