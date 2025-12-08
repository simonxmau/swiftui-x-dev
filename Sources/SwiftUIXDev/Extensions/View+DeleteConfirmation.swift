//
//  File.swift
//  swiftui-x-dev
//
//  Created by Simon Mau on 2025/12/8.
//

import Foundation
import SwiftUI

extension View {
    public func onDeleteConfirmation(
        isPresented: Binding<Bool>,
        deleteAction: @escaping () -> Void
    ) -> some View {
        return AnyView(
            self.confirmationDialog(
                "Are you sure you want to delete?",
                isPresented: isPresented,
                titleVisibility: .visible
            ) {
                Button("Delete", role: .destructive, action: deleteAction)
            }
        )
    }
}
