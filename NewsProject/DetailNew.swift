//
//  DetailNew.swift
//  NewsProject
//
//  Created by Naomi Ortiz González on 6/22/21.
//  Copyright © 2021 Naomi Ortiz Gonzalez. All rights reserved.
//

import SwiftUI

struct DetailNew: View {
    var article : Articles
    var body: some View{
        VStack(spacing: 10){
        
            if(article.urlToImage != nil){
                ImageView(withURL: "\(article.urlToImage!)", width:375, height:200,type:1)
            }else{
            ImageView(withURL:"https://llerena.org/wp-content/uploads/2017/11/imagen-no-disponible.jpg", width: 375, height:200,type:1)
            }
            if(article.author != nil){
                Text("Autor:\(article.author!)").fontWeight(.medium).padding(.leading, 10).foregroundColor(.purple).multilineTextAlignment(.trailing).font(.system(size: 18))
                
            }else{
                Text("Autor: Desconocido").fontWeight(.medium).padding(.leading, 10).foregroundColor(.purple).multilineTextAlignment(.trailing).font(.system(size: 18))
                
            }
            Text(article.publishedAt).fontWeight(.light).padding(.all, 20).multilineTextAlignment(.trailing).font(.system(size: 18))
            Text(article.title).fontWeight(.semibold).padding(.all, 10).lineLimit(3).truncationMode(.middle).foregroundColor(.purple).multilineTextAlignment(.center).font(.system(size: 30))
            if(article.content != nil){
                Text("\(article.content!)").fontWeight(.medium).padding(.all, 10).multilineTextAlignment(.center).lineLimit(7).font(.system(size: 22))
                
            }else{
                if(article.description != nil){
                    Text("\(article.description!)").fontWeight(.medium).padding(.all, 10).multilineTextAlignment(.center).lineLimit(7).truncationMode(.middle).font(.system(size: 22))
                    
                }else{
                    Text("Sin detalles").fontWeight(.medium).padding(.all, 10).multilineTextAlignment(.trailing).font(.system(size: 22))
                
                }
            
            }
            
        }
    }

}
