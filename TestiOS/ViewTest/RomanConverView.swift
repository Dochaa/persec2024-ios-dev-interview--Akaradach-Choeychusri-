
//
//  RomanConverView.swift
//  TestiOS
//
//  Created by Akaradach Choeychusri on 1/5/2568 BE.
//
import SwiftUI

struct RomanConverView: View {
    @State private var arabicInput: String = ""
    @State private var romanOutput: String = ""
    
    @State private var romanInput: String = ""
    @State private var arabicOutput: Int?
    
    var body: some View {
        VStack(spacing: 20) {
            Text("เลขอารบิก → โรมัน")
                .font(.headline)
            TextField("เลขอารบิก เช่น 1989", text: $arabicInput)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            Button("แปลงเป็นโรมัน") {
                if let number = Int(arabicInput) {
                    romanOutput = intToRoman(number)
                }
            }
            Text("โรมัน: \(romanOutput)")
                .padding(.bottom)
            
            Divider()
            
            Text("เลขโรมัน → อารบิก")
                .font(.headline)
            TextField("เลขโรมัน เช่น MCMLXXXIX", text: $romanInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .onChange(of: romanInput) { newValue in
                       romanInput = newValue.uppercased()
                   }
            Button("แปลงเป็นอารบิก") {
                arabicOutput = romanToInt(romanInput)
            }
            if let output = arabicOutput {
                Text("อารบิก: \(output)")
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("เลขโรมัน")
    }
}


func intToRoman(_ num: Int) -> String {
    let romanMap: [(symbol: String, value: Int)] = [
        ("M", 1000), ("CM", 900), ("D", 500), ("CD", 400),
        ("C", 100), ("XC", 90), ("L", 50), ("XL", 40),
        ("X", 10), ("IX", 9), ("V", 5), ("IV", 4), ("I", 1)
    ]
    
    var result = ""
    var number = num
    
    for (symbol, value) in romanMap {
        while number >= value {
            result += symbol
            number -= value
        }
    }
    return result
}
