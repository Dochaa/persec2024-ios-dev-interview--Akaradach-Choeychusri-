//
//  TribonacciView.swift
//  TestiOS
//
//  Created by Akaradach Choeychusri on 1/5/2568 BE.
//
import SwiftUI

struct TribonacciView: View {
    @State private var seedText: String = "1, 3, 5"
    @State private var countText: String = "5"
    @State private var result: [Int] = []
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Tribonacci Sequence")
                .font(.headline)
            
            TextField("ใส่ค่าเริ่มต้น เช่น 1, 3, 5", text: $seedText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            TextField("จำนวนที่ต้องการ เช่น 5", text: $countText)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            Button("คำนวณ") {
                let seed = seedText
                    .split(separator: ",")
                    .map { Int($0.trimmingCharacters(in: .whitespaces)) ?? 0 }
                let count = Int(countText) ?? 0
                result = tribonacci(seed, count)
            }
            .padding(.horizontal)
            
            VStack(alignment: .leading) {
                Text("ผลลัพธ์:")
                Text(result.map(String.init).joined(separator: ", "))
                    .padding(.top, 4)
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .padding()
    }
}

func tribonacci(_ seed: [Int], _ n: Int) -> [Int] {
    guard n > 0 else { return [] }
    
    var result = seed
    while result.count < n {
        let next = result.suffix(3).reduce(0, +)
        result.append(next)
    }
    
    return Array(result.prefix(n))
}


func romanToInt(_ roman: String) -> Int {
    let romanMap: [Character: Int] = [
        "I": 1, "V": 5, "X": 10, "L": 50,
        "C": 100, "D": 500, "M": 1000
    ]
    
    let chars = Array(roman)
    var result = 0
    var prev = 0
    
    for char in chars.reversed() {
        let value = romanMap[char] ?? 0
        if value < prev {
            result -= value
        } else {
            result += value
        }
        prev = value
    }
    
    return result
}
