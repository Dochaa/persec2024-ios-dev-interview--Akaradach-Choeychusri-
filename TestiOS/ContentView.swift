//
//  ContentView.swift
//  TestiOS
//
//  Created by Akaradach Choeychusri on 1/5/2568 BE.
//

import SwiftUI


struct ContentView: View {
    let topics: [(title: String, view: AnyView)] = [
        ("ตรวจสอบวงเล็บ", AnyView(BracketValidatorView())),
        ("เรียงลำดับรหัส", AnyView(SortedStringArrayView())),
        ("Search Autocomplete", AnyView(AutocompleteView())),
        ("เรียงตัวเลขจากมากไปน้อย", AnyView(SortDigitsDescendingView())),
        ("Tribonacci Sequence", AnyView(TribonacciView())),
        ("แปลงเลขโรมัน", AnyView(RomanConverView()))
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<topics.count, id: \.self) { index in
                    NavigationLink(destination: topics[index].view) {
                        Text(topics[index].title)
                    }
                }
            }
            .navigationTitle("Test")
        }
    }
}
