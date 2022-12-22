//
//  ContentView.swift
//  TwitterClone
//
//  Created by Bence Papp on 2022. 12. 14..
//

import Kingfisher
import SwiftUI

struct ContentView: View {
    @State private var showMenu = false
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
        Group {
            if viewModel.userSession == nil {
                LoginView()
            } else {
                mainInterfaceView
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView {
    var mainInterfaceView: some View {
        ZStack(alignment: .topLeading) {
            MainTabView()
                .navigationBarHidden(showMenu)

            if showMenu {
                ZStack {
                    Color(.black)
                        .opacity(showMenu ? 0.25 : 0.0)
                }.onTapGesture {
                    withAnimation(.easeInOut) {
                        showMenu = false
                    }
                }
                .ignoresSafeArea()
            }

            SideMenuView()
                .frame(width: 300)
                .padding(.top, 100)
                .offset(x: showMenu ? 0 : -300, y: 0)
                .background(showMenu ? Color.white : Color.clear)
                .ignoresSafeArea()
        }
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                if let user = viewModel.currentUser {
                    Button {
                        withAnimation(.easeInOut) {
                            showMenu.toggle()
                        }
                    } label: {
                        KFImage(URL(string: user.profileImageUrl))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 32, height: 32)
                            .clipShape(Circle())
                    }
                } else {
                    Circle()
                        .frame(width: 32, height: 32)
                        .foregroundColor(Color(.systemBlue))
                }
            }
        }
        .onAppear {
            showMenu = false
        }
    }
}
