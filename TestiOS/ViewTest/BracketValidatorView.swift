//
//  BracketValidatorView.swift
//  TestiOS
//
//  Created by Akaradach Choeychusri on 1/5/2568 BE.
//
import SwiftUI

struct BracketValidatorView: View {
    @State private var input: String = ""
    @State private var result: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("ตรวจสอบการจับคู่ของวงเล็บ")
                .font(.headline)
            
            TextField("ใส่ข้อความ เช่น ([{}])", text: $input)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .onChange(of: input) { newValue in
                        input = newValue.filter { "()[{}]".contains($0) }
                    }

            
            Button("ตรวจสอบ") {
                let isValid = isValidBrackets(input)
                result = isValid ? "✔️ ครบคู่" : "❌ ไม่ครบคู่"
            }
            .padding(.horizontal)
            
            Text("ผลลัพธ์: \(result)")
                .padding(.horizontal)
            
            Spacer()
        }
        .padding()
    }
}

func isValidBrackets(_ input: String) -> Bool {
    let bracketPairs: [Character: Character] = [
        ")": "(",
        "]": "[",
        "}": "{"
    ]
    
    var stack: [Character] = []
    
    for char in input {
        if char == "(" || char == "[" || char == "{" {
            stack.append(char)
        } else if let expectedOpen = bracketPairs[char] {
            if stack.last == expectedOpen {
                stack.removeLast()
            } else {
                return false
            }
        } else {
            return false
        }
    }
    
    return stack.isEmpty
}
