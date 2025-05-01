//
//  Untitled.swift
//  TestiOS
//
//  Created by Akaradach Choeychusri on 1/5/2568 BE.
//

import SwiftUI

struct SortDigitsDescendingView: View {
    @State private var inputText: String = ""
    @State private var result: Int?
    
    var body: some View {
        VStack(spacing: 16) {
            Text("เรียงลำดับเลขจากมากไปน้อย")
                .font(.headline)
            
            TextField("ใส่เลข เช่น 1989", text: $inputText)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            Button("แปลง") {
                if let num = Int(inputText) {
                    result = sortDigitsDescending(num)
                }
            }
            .padding(.horizontal)
            
            if let result = result {
                Text("ผลลัพธ์: \(result)")
                    .padding(.top, 8)
            }
            
            Spacer()
        }
        .padding()

    }
}

func sortDigitsDescending(_ number: Int) -> Int {
    let sortedDigits = String(number)
        .compactMap { $0.wholeNumberValue }
        .sorted(by: >)
    
    let sortedString = sortedDigits.map(String.init).joined()
    return Int(sortedString) ?? number
}
