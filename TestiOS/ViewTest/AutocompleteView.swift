//
//  Untitled.swift
//  TestiOS
//
//  Created by Akaradach Choeychusri on 1/5/2568 BE.
//

import SwiftUI

struct AutocompleteView: View {
    @State private var searchText: String = "th"
    @State private var result: [String] = []
    
    let itemList: [String] = ["Mother", "Think", "Worthy", "Apple", "Android"]
//    let maxResult: Int = 2
    @State private var maxResult: String = "2"

    var body: some View {
        VStack(spacing: 16) {
            Text("Search Autocomplete")
                .font(.headline)
            
            TextField("คำค้น เช่น th", text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .onChange(of: searchText) { _ in updateResult() }
            
            TextField("จำนวนผลลัพธ์", text: $maxResult)
                         .keyboardType(.numberPad)
                         .textFieldStyle(RoundedBorderTextFieldStyle())
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
        .onAppear {
            updateResult()
        }
    }

    func updateResult() {
        let max = Int(maxResult) ?? 0
        result = autocomplete(search: searchText, items: itemList, maxResult: max)
    }
}

func autocomplete(search: String, items: [String], maxResult: Int) -> [String] {
    let lowerSearch = search.lowercased()

    let filtered = items.filter { $0.lowercased().contains(lowerSearch) }

    let sorted = filtered.sorted {
        let a = $0.lowercased()
        let b = $1.lowercased()

        let aIndex = a.range(of: lowerSearch)?.lowerBound
        let bIndex = b.range(of: lowerSearch)?.lowerBound

        switch (aIndex, bIndex) {
        case let (a?, b?): return a < b
        case (_?, nil): return true
        case (nil, _?): return false
        default: return a < b
        }
    }

    return Array(sorted.prefix(maxResult))
}


