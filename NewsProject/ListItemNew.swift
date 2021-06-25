//
//  ListItemNew.swift
//  NewsProject
//
//  Created by Naomi Ortiz González on 6/22/21.
//  Copyright © 2021 Naomi Ortiz Gonzalez. All rights reserved.
//

import SwiftUI

struct ListItemNew: View {
    //definimos la variable que vamos a pasar por el constructor
    var article: Articles
    var body: some View {
        NavigationLink(destination: DetailNew(article: article)){
            VStack{
                if(article.urlToImage != nil){
                    ImageView(withURL: "\(article.urlToImage!)", width: 375, height:200,type:1)
                }else{
                ImageView(withURL:"https://llerena.org/wp-content/uploads/2017/11/imagen-no-disponible.jpg", width: 375, height:200,type:1)
                
                }
              
                Text(article.title).fontWeight(.bold).padding(.leading, 10).foregroundColor(.accentColor).lineLimit(3).truncationMode(.middle).multilineTextAlignment(.center)
            }.clipShape(Rectangle()).shadow(radius: 5)//esquinas redondeadas
        }
    }
    
    
}


