//
//  HomeVM.swift
//  FoodDelivery
//
//  Created by Harshit Parikh on 01/05/21.
//

import Foundation

class HomeVM: ObservableObject {
    
    @Published var dataModel: [FoodStatusModel] = []
    var currentSelectedIndex: Int = -1
    
    init() {
        self.dataModel = [FoodStatusModel(status: .orderReceived), FoodStatusModel(status: .foodBeingPrepared), FoodStatusModel(status: .outForDelivery), FoodStatusModel(status: .delivered)]
    }
    
    func changeStatusTapped() {
        self.currentSelectedIndex += 1
        if currentSelectedIndex < dataModel.count  {
            self.dataModel[currentSelectedIndex].isCompleted = true
        }
    }
    
    func nextOrderTapped() {
        self.currentSelectedIndex = -1
        self.dataModel = [FoodStatusModel(status: .orderReceived, isCompleted: false), FoodStatusModel(status: .foodBeingPrepared, isCompleted: false), FoodStatusModel(status: .outForDelivery, isCompleted: false), FoodStatusModel(status: .delivered, isCompleted: false)]
    }
}
