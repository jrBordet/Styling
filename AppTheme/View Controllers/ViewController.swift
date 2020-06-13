//
//  ViewController.swift
//  AppThemeDemo
//
//  Created by Jean Raphael Bordet on 18/05/2020.
//  Copyright © 2020 Jean Raphael Bordet. All rights reserved.
//

import UIKit
import SceneBuilder
import Styling
import Caprice

public func backgroundLabel(with color: UIColor) -> LabelStyle { { $0.backgroundColor = color } }

public func fontLabel(with size: CGFloat, weight: UIFont.Weight = .regular) -> LabelStyle { { $0.font = UIFont.systemFont(ofSize: size, weight: weight) } }

public func titleFont(size: CGFloat, weight: UIFont.Weight = .regular) -> ButtonStyle {
    return {
        $0.titleLabel?.font = UIFont.systemFont(ofSize: size, weight: weight)
    }
}

public struct AppThemeMaterial {
    public var primaryLabel: LabelStyle
    public var primaryButton: ButtonStyle
    public var cardView: ViewStyle
    public var detailView: ViewStyle
    public var background: ViewStyle
    public var errorView: ViewStyle
    public var errorLabel: LabelStyle
    
    public init (
        primaryLabel: @escaping LabelStyle,
        primaryButton: @escaping ButtonStyle,
        card: @escaping ViewStyle,
        detailView: @escaping ViewStyle,
        background: @escaping ViewStyle,
        error: @escaping ViewStyle,
        errorStyle: @escaping LabelStyle
    ) {
        self.primaryLabel = primaryLabel
        self.primaryButton = primaryButton
        self.cardView = card
        self.detailView = detailView
        self.background = background
        self.errorView = error
        self.errorLabel = errorStyle
    }
}

extension AppThemeMaterial {
    static let swiftHeroes = AppThemeMaterial(
        primaryLabel:
        lightLabelStyle
            <> { $0.font = UIFont.systemFont(ofSize: 23, weight: .thin) }
            <> textColor(color: .primaryColorVariant)
            <> backgroundLabel(with: .surfaceColor),
        primaryButton:
        { $0.setTitleColor(.onPrimaryColor, for: .normal) }
            <> filledButton(UIColor.primaryColor)
            <> titleFont(size: 23, weight: .thin)
            <> rounded(with: 5),
        card: { $0.backgroundColor = .surfaceColor } <> rounded(with: 5),
        detailView: { $0.backgroundColor = .secondaryColor } ,
        background: { $0.backgroundColor = .backgroundColor } <> rounded(with: 5),
        error: { $0.backgroundColor =  .errorColor } <> rounded(with: 5),
        errorStyle:
        lightLabelStyle
            <> fontLabel(with: 23, weight: .thin)
            <> textColor(color: .onErrorColor)
            <> rounded(with: 5)
    )
}

class ViewController: UIViewController {
    @IBOutlet var mainCard: UIView!
    @IBOutlet var mainLabel: UILabel!
    
    @IBOutlet var errorCard: UIView!
    @IBOutlet var errorLabel: UILabel!
    
    @IBOutlet var genericButton: UIButton!
    
    let theme: AppThemeMaterial = .swiftHeroes
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view |> theme.background
        navigationController!.navigationBar |> { $0.barTintColor = .primaryColor }
        
        mainCard |> theme.cardView
        
        mainLabel
            |> theme.primaryLabel
            <> textLabel("main label")
        
        errorCard |> theme.errorView
        errorLabel |> theme.errorLabel <> textLabel("error")
        
        genericButton |> titleButton("generic button") <> theme.primaryButton
    }
    
    @IBAction func openDetailTap(_ sender: Any) {
        navigationLink(
            from: self,
            destination: Scene<DetailViewController>(),
            completion: { _ in },
            isModal: true
        )
    }
}
