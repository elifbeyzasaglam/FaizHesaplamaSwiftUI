//
//  ContentView.swift
//  FaizHesaplayıcıUI
//
//  Created by ELİF BEYZA SAĞLAM on 12.08.2022.
//

import SwiftUI

struct ContentView: View {
    @State var anaPara = 0
    
    let formatter:NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "tr_TR")
        return formatter
    }()
    //Dictionary
    let faizOranlar: [Int:Double] = [3:0.2, 6:0.25, 9:0.30 , 12:0.50]
    @State var seçilenVade = 3
    var toplamPara:String{
        let faizGetirisi = Double(anaPara) * faizOranlar[seçilenVade]!
        
        let toplamGetiri = formatter.string(from: NSNumber(value:faizGetirisi + Double(anaPara)) )
        return toplamGetiri!
        
    }
        var body: some View {
        VStack{
            Image("ziraat")
                .resizable()
                .scaledToFit()
                .frame(width:220)
            
            Text("Ana Para")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.red)
            HStack{
                TextField("0 TL",value:$anaPara, formatter:formatter)
                    .keyboardType(.numberPad)
                    .padding()
                    .frame(height:60)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
            }
            .padding()
            
            Text("Vade Seçiniz")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.red)
            
            Picker("Vade Seçiniz", selection: $seçilenVade){
                ForEach(Array(faizOranlar.keys.sorted()),id: \.self){ item in
                Text("\(item)")
                }
            }.pickerStyle(.segmented)
                .padding()
           
            Spacer()
            
            Text(toplamPara)
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
