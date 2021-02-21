//
//  SPRecommendVC.swift
//  SwiftProjectKit
//
//  Created by a on 2019/12/14.
//  Copyright © 2019 HMRL. All rights reserved.
//

import UIKit
import HandyJSON
import SwiftyJSON

class SPRecommendVC: UIViewController {
    
    var guessYouLikeList: [GuessYouLikeModel]?


    override func viewDidLoad() {
        super.viewDidLoad()
        self.a()
    }
    
    func a (){
        //首页推荐接口请求
        FMRecommendProvider.request(.guessYouLikeMoreList) { result in
            if case let .success(response) = result {
                //解析数据
                let data = try? response.mapJSON()
                let json = JSON(data!)
                if let guessYouLikeModel = JSONDeserializer<GuessYouLikeModel>.deserializeModelArrayFrom(json: json["list"].description) {
                    self.guessYouLikeList = guessYouLikeModel as? [GuessYouLikeModel]
//                    self.collectionView.reloadData()
                }
            }
        }
        
    }

}
