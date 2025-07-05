//
//  OverlayMessageView.swift
//  PillKit
//
//  Created by ceviixx on 27.05.25.
//

import SwiftUI

public struct OverlayMessageView: View {
    public let type: GlobalOverlayContent
    public var maxWidth: CGFloat? = nil
    
    public var body: some View {
        HStack(spacing: 7) {
            Image(systemName: type.systemImage)
                .foregroundColor(Color.white)
                .font(.title)
            
            VStack(alignment: .leading, spacing: 0) {
                Text(type.title)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.white)
                if let message = type.message {
                    Text(message)
                        .foregroundColor(Color.white)
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                }
            }
            .padding(.trailing, 9)
            .frame(height: 25)
        }
        .padding(.vertical, 7)
        .padding(.horizontal, type.message == nil ? 8 : 10)
        .background(type.backgroundColor)
        .cornerRadius(30)
        .frame(maxWidth: maxWidth, alignment: .center)
    }
}


#Preview {
    NavigationView {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    OverlayMessageView(type: .success(message: "200 OK"))
                    OverlayMessageView(type: .failure(message: "404 Not found"))
                }
                
                Divider().padding(.vertical)
                
                HStack {
                    OverlayMessageView(type: .success(message: "Authorized"))
                    OverlayMessageView(type: .failure(message: "Not authorized"))
                }
                
                Divider().padding(.vertical)
                
                HStack {
                    OverlayMessageView(type: .success(message: nil))
                    OverlayMessageView(type: .failure(message: nil))
                }
                
                Divider().padding(.vertical)
                
                HStack {
                    OverlayMessageView(type: .default(title: "CUSTOM", message: "Message", systemImage: "person.circle.fill", color: Color.purple))
                    OverlayMessageView(type: .default(title: "CUSTOM", systemImage: "person.circle.fill", color: Color.purple))
                }
                
                Divider().padding(.vertical)
                
                HStack {
                    OverlayMessageView(type: .success(title: "Created"))
                    OverlayMessageView(type: .failure(title: "Failed"))
                }
                
            }
            
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("PillKit")
    }
}
