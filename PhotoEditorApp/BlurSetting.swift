//
//  BlurSetting.swift
//  PhotoEditorApp
//
//  Created by El houssaine El GAMOUZ on 1/10/2024.
//

import Foundation
import Combine

class BlurSetting: ObservableObject {

    @Published var backgroundBlur: CGFloat = 0

    let userDefaultKey = "backgroundBlur"
    var subscriptions = Set<AnyCancellable>()

    init() {
        backgroundBlur = UserDefaults.standard.double(forKey: userDefaultKey)
        $backgroundBlur
            .dropFirst()
            .debounce(for: .milliseconds(500), scheduler: DispatchQueue.main)
            .sink { [unowned self] value in
            print("Save new value to user default\(value)")
            UserDefaults.standard.setValue(value, forKey: self.userDefaultKey)
        }
        .store(in: &subscriptions)
    }

}
