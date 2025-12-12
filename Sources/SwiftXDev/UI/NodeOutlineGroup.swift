//
//  NodeOutlineGroup.swift
//  swift-x-dev
//
//  Created by Simon Mau on 2025/12/10.
//  From: https://stackoverflow.com/questions/62832809/list-or-outlinegroup-expanded-by-default-in-swiftui
//
import SwiftUI

public struct NodeOutlineGroup<Node, Content>: View where Node: Hashable, Node: Identifiable, Node: CustomStringConvertible, Content: View {
    let node: Node
    let childKeyPath: KeyPath<Node, [Node]?>
    @State var isExpanded: Bool = true
    let content: (Node) -> Content
    
    public var body: some View {
        if let children = node[keyPath: childKeyPath], !children.isEmpty {
            DisclosureGroup(
                isExpanded: $isExpanded,
                content: {
                    if isExpanded {
                        ForEach(children, id: \.self) { childNode in
                            NodeOutlineGroup(node: childNode, childKeyPath: childKeyPath, isExpanded: isExpanded, content: content)
                        }
                    }
                },
                label: {
                    content(node)
                }
            )
        } else {
            content(node)
        }
    }
}
