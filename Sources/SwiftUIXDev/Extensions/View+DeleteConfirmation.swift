//
//  File.swift
//  swiftui-x-dev
//
//  Created by Simon Mau on 2025/12/8.
//

import Foundation
import SwiftUI

extension View {
    func onDeleteConfirmation(
        isPresented: Binding<Bool>,
        deleteAction: @escaping () -> Void
    ) -> some View {
        if #available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *) {
            return AnyView(
                self.confirmationDialog(
                    "Are you sure you want to delete?",
                    isPresented: isPresented,
                    titleVisibility: .visible
                ) {
                    Button("Delete", role: .destructive, action: deleteAction)
                }
            )
        } else {
            return AnyView(
                self.actionSheet(isPresented: isPresented) {
                    ActionSheet(
                        title: Text("Are you sure you want to delete?"),
                        buttons: [
                            .destructive(Text("Delete"), action: deleteAction),
                            .cancel()
                        ]
                    )
                }
            )
        }
    }
}
