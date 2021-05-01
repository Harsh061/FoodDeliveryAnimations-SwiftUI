//
//  HomeView.swift
//  FoodDelivery
//
//  Created by Harshit Parikh on 01/05/21.
//

import SwiftUI

enum OrderStatus: Int {
    case orderReceived
    case foodBeingPrepared
    case outForDelivery
    case delivered
    
    var title: String {
        switch self {
        case .orderReceived:
            return "Order Received"
        case  .foodBeingPrepared:
            return "Your food is being prepared"
        case .outForDelivery:
            return "Out for Delivery"
        case .delivered:
             return "Delivered"
        }
    }
    
    var color: Color {
        switch self {
        case .orderReceived:
            return .red
        case  .foodBeingPrepared:
            return .orange
        case .outForDelivery:
            return .blue
        case .delivered:
            return .green
        }
    }
    
    var image: String {
        switch self {
        case .orderReceived:
            return "orderReceived"
        case  .foodBeingPrepared:
            return "foodBeingPrepared"
        case .outForDelivery:
            return "outForDelivery"
        case .delivered:
            return "delivered"
        }
    }
}

struct HomeView: View {
    @StateObject var viewModel: HomeVM
    
    var body: some View {
        NavigationView {
            VStack {
                ForEach(0..<self.viewModel.dataModel.count) { i in
                    VStack {
                        if i != 0 {
                            Capsule(style: .continuous)
                                .frame(width: 10, height: self.viewModel.dataModel[i].isCompleted ? 80 : 10)
                                .foregroundColor(self.viewModel.dataModel[i].status.color)
                                .animation(Animation.easeOut(duration: 0.5))
                        }
                        
                        ZStack {
                            HStack {
                                if i % 2 == 0  {
                                    if self.viewModel.dataModel[i].isCompleted {
                                        Image(self.viewModel.dataModel[i].status.image)
                                            .resizable()
                                            .frame(width: 100, height: 100)
                                            .padding(.leading, 30)
                                            .transition(.move(edge: .leading))
                                            .animation(.default)
                                    }
                            
                                    Spacer()
                                }
                                
                                Text(self.viewModel.dataModel[i].status.title)
                                    .font(self.viewModel.dataModel[i].isCompleted ? .headline : .subheadline)
                                    .frame(width: 150)
                                    .padding(i % 2 == 0 ? .trailing : .leading, 10)
                                    .multilineTextAlignment(.center)
                                
                                
                                if i % 2 != 0 {
                                    Spacer()
                                    
                                    if self.viewModel.dataModel[i].isCompleted {
                                        Image(self.viewModel.dataModel[i].status.image)
                                            .resizable()
                                            .frame(width: 100, height: 100)
                                            .padding(.trailing, 30)
                                            .transition(.move(edge: .trailing))
                                            .animation(.default)
                                    }
                                }
                            }
                            
                            Circle()
                                .strokeBorder(Color.black, lineWidth: 4)
                                .background(Circle().foregroundColor(self.viewModel.dataModel[i].isCompleted ? self.viewModel.dataModel[i].status.color : Color.white))
                                .frame(width: 50, height: 50)
                                .animation(.easeInOut(duration: self.viewModel.dataModel[i].isCompleted ? 0.5 : 0))
                        }
                        
                    }
                }
                
                Spacer()
                
                if self.viewModel.currentSelectedIndex < self.viewModel.dataModel.count - 1 {
                    Button(action: {
                        self.viewModel.changeStatusTapped()
                    }) {
                        Text("Change Status")
                            .bold()
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.red)
                    .animation(.default)
                } else {
                    Button(action: {
                        self.viewModel.nextOrderTapped()
                    }) {
                        Text("Next Order")
                            .bold()
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.red)
                    .animation(.default)
                }
            }
            .padding()
            .background(Color.blue.opacity(0.25))
            
            .navigationBarTitle(Text("Food Delivery"), displayMode: .inline)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeVM())
    }
}
