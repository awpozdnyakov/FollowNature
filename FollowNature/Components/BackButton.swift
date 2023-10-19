//
//  BackButton.swift
//  FollowNature
//
//  Created by Macbook on 14.10.2023.
//

import SwiftUI

struct BackButton: View {
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>

    var body: some View {
        VStack {

        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 35, height: 30)
                        .foregroundColor(Color("green"))
                }
            }
        }
        .navigationBarHidden(false)
        .navigationBarBackButtonHidden(true)
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton()
    }
}

//struct BackButton: View {
//
//    @Environment(\.presentationMode) var presentationMode
//
//    var body: some View {
//        VStack {
//            Button {
//                presentationMode.wrappedValue.dismiss()
//            } label: {
//                Image(systemName: "arrow.left")
//                    .resizable()
//                    .frame(width: 35, height: 30)
//                    .foregroundColor(Color("green"))
//            }
//
//        }
//    }
//}
