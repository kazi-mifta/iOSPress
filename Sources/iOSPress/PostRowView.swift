//
//  PostView.swift
//  FitPlan
//
//  Created by Mohammad Mainul Islam on 9/3/20.
//  Copyright © 2020 Arcade Studios. All rights reserved.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI

struct PostRowView: View {
    var post: Post
    var body: some View {
        
        HStack(spacing: 20.0) {
            // if there is no featured media is nil then ImageView won't be created___
            post.featuredMediaUrl.map { url in
                WebImage(url: URL(string: url))
                .onSuccess { image, data, cacheType in
                    // Success
                    // Note: Data exist only when queried from disk cache or network. Use `.queryMemoryData` if you really need data
                }
                .resizable()
                .placeholder(Image("placeholder"))
                .indicator(.activity) // Activity Indicator
                .transition(.fade(duration: 0.5)) // Fade Transition with duration
                .scaledToFit()
                .cornerRadius(10)
                .shadow(color: .gray, radius: 10.0, x: 4.0, y: 4.0)
                .frame(width: 110, height: 100, alignment: .center)
            }
            // ____
            
            VStack(alignment: .leading) {
                Text("\(post.title?.rendered ?? "")")
                    .font(.headline)
                Text("Date : \((post.date?.toString(format: "dd MMM, yyyy"))!)")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            NavigationLink("", destination: PostWebView(postUrl: post.link!)).frame(width: 5, height: 10, alignment: .trailing)
        }
        
    }
}


extension Date {
    func toString(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
}
