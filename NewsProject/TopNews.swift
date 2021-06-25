//
//  TopNews.swift
//  NewsProject
//
//  Created by Naomi Ortiz González on 6/22/21.
//  Copyright © 2021 Naomi Ortiz Gonzalez. All rights reserved.
//

import SwiftUI

struct TopNews: View {
    //arreglo, @State detecta el cambio en su valor y se vuelve ejecutar el body, renderizando la vista
    @State private var listNews = [Articles]()
    
    var body: some View {
        NavigationView{
            //lista que se genera a partir de un conjunto de elementos
            //la lista se va a iterar en cada elemento de las lista listNews y se va a vaciar en la variable movie, es similar a un foreach
        
            List(listNews, id: \.title){ article in
                ListItemNew(article: article)
                //cuando aparezca la interfaz llama a al método getPopular
            }.onAppear(perform: getTopNews)
            .navigationBarTitle("Top News")
            }
        }
    func getTopNews(){
     //consume la API y obtiene la lista de populares
        
        let session = URLSession(configuration: .default)
        session.dataTask(with: URL(string: "http://newsapi.org/v2/top-headlines?country=mx&apiKey=16919029d1a24e1e9a45d8176b8e6db9")!){
            data,_,_ in
            do{
                    let articles = try JSONDecoder().decode(NewsDAO.self, from:data!)
                DispatchQueue.main.async {
                    self.listNews = articles.articles
                }
            }catch{
              print(error)
                
            }
            
        }.resume()
        
    }
}

struct TopNews_Previews: PreviewProvider {
    static var previews: some View {
        TopNews()
    }
}
