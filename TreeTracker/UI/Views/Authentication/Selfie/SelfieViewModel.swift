//
//  SelfieViewModel.swift
//  TreeTracker
//
//  Created by Alex Cornforth on 18/06/2020.
//  Copyright © 2020 Greenstand. All rights reserved.
//

import UIKit

class SelfieViewModel {

    let title = "Take Selfie"
    private var image: UIImage?

    var selfieButtonTitle: String {
        guard image != nil else {
            return "Take Photo"
        }
        return "Retake"
    }

    let selfiePlaceHolderImage = Asset.Assets.selfie.image

    var selfiePreviewImage: UIImage {
        guard let image = image else {
            return selfiePlaceHolderImage
        }
        return image
    }

    var doneButtonEnabled: Bool {
        guard image != nil else {
            return false
        }
        return true
    }

    var selfiePreviewContentMode: UIView.ContentMode {
        guard image != nil else {
            return .scaleAspectFit
        }
        return .scaleAspectFill
    }

    func updateImage(image: UIImage) {
        self.image = image
    }
}
