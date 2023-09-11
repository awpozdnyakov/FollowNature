//
//  PreviewMock.swift
//  FollowNature
//
//  Created by Andrey Pozdnyakov on 12.09.2023.
//

import XCoordinator

extension UnownedRouter {
    static func previewMock<T: Route>() -> UnownedRouter<T> {
        return UnownedRouter(EmptyRouter<T>(), erase: { StrongRouter<T>($0) })
    }
}
