//
//  PhotoEditorView.swift
//  PhotoEditorApp
//
//  Created by El houssaine El GAMOUZ on 1/10/2024.
//

import SwiftUI

struct PhotoEditorView: View {
    @StateObject var blurSetting = BlurSetting()
    @State var backgroundBrightness: CGFloat = -0.3
    @State var forgroundBrightness: CGFloat = 0.1
    var body: some View {
        ZStack {
            Image("cat1")
                .resizable()
                .scaledToFit()
                .brightness(forgroundBrightness)
            Image("backgroundImage")
                .resizable()
                .scaledToFit()
                .blur(radius:blurSetting.backgroundBlur)
                .brightness(backgroundBrightness)
        }
        ImageSettingSLider(valueName: "Background Blur", 
                           range: 0...20,
                           value: $blurSetting.backgroundBlur)
        ImageSettingSLider(valueName: "Background Brightness",
                           range: -0.5...0.5,
                           value: $backgroundBrightness)
        ImageSettingSLider(valueName: "ForgroundBrightness", 
                           range: -0.5...0.5,
                           value: $forgroundBrightness)
    }
}

#Preview {
    PhotoEditorView()
}

struct ImageSettingSLider: View {
    let valueName: String
    let range: ClosedRange<CGFloat>
    @Binding var value: CGFloat
    var body: some View {
        HStack {
            Text("\(valueName): \(String(format: "%.1f",value))")
            Slider(value: $value, in: range)
        }
        .padding()
    }
}
