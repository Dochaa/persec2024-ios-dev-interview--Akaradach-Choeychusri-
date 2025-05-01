//
//  SortedStringArrayView.swift
//  TestiOS
//
//  Created by Akaradach Choeychusri on 1/5/2568 BE.
//

import SwiftUI

struct SortedStringArrayView: View {
    @State private var inputText: String = "TH19, SG20, TH2"
    @State private var result: [String] = []
    
    var body: some View {
        VStack(spacing: 16) {
            Text("เรียงลำดับรหัส")
                .font(.headline)
            
            TextField("ใส่รายการ เช่น TH19, SG20, TH2", text: $inputText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            Button("เรียงลำดับ") {
                let array = inputText
                    .split(separator: ",")
                    .map { $0.trimmingCharacters(in: .whitespaces) }
                result = sortedBySuffixNumber(array)
            }
            .padding(.horizontal)
            
            VStack(alignment: .leading) {
                Text("ผลลัพธ์:")
                ForEach(result, id: \.self) { item in
                    Text("• \(item)")
                }
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .padding()
    }
}


func sortedBySuffixNumber(_ input: [String]) -> [String] {
    return input.sorted { a, b in
        let (prefixA, numberA) = splitPrefixNumber(from: a)
        let (prefixB, numberB) = splitPrefixNumber(from: b)
        
        if prefixA != prefixB {
            return prefixA < prefixB
        }
        return numberA < numberB
    }
}

private func splitPrefixNumber(from text: String) -> (String, Int) {
    let letters = text.prefix { $0.isLetter }
    let rest = text.drop { $0.isLetter }
    let digits = rest.prefix { $0.isNumber }
    
    let number = Int(digits) ?? Int.max
    return (String(letters), number)
}

