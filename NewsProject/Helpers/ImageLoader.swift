//
//  ImageLoader.swift
//  NewsProject
//
//  Created by Naomi Ortiz González on 6/22/21.
//  Copyright © 2021 Naomi Ortiz Gonzalez. All rights reserved.
//

import SwiftUI
import Combine //manejo de imágenes

struct ImageView: View {
    @ObservedObject var imageLoader: ImageLoader
    @State var image: UIImage = UIImage()
    var width  : CGFloat
    var height : CGFloat
    var type   : Int
    
    init(withURL url: String, width: CGFloat, height: CGFloat, type: Int){
        imageLoader = ImageLoader(urlString: url)
        //enviar parametros a las variables
        self.width  = width
        self.height = height
        self.type   = type
    }
    
    var body: some View {
        //contenedor que acomoda los elementos de forma apilada, similar a un Column
        VStack{
            if type==1{
                //type=1 imagen cuadrada
                //! indica que el valor no puede ser nulo
                Image(uiImage: imageLoader.dataIsValid ? imageLoader.imageFromData(imageLoader.data!) : UIImage())
                .resizable()
                .aspectRatio(contentMode: .fit) //se ajusta al contenido
                    .frame(width: self.width, height: self.height)
            }else{
                //type=2 imagen rectangular con redondeado
                //! indica que el valor no puede ser nulo
                Image(uiImage: imageLoader.dataIsValid ? imageLoader.imageFromData(imageLoader.data!) : UIImage())
                .resizable()
                .clipShape(Circle())
                .aspectRatio(contentMode: .fit) //se ajusta al contenido
                .frame(width: self.width, height: self.height)
                    .overlay(Circle().stroke(Color.gray, lineWidth: 4))
                .shadow(radius: 10)
            }
        }.onReceive(imageLoader.didChange){ data in
            self.image = UIImage(data: data) ?? UIImage()
        }
    }
}

class ImageLoader: ObservableObject {
    
    @Published var dataIsValid = false
    var data : Data?
    var didChange = PassthroughSubject <Data, Never>()
    init(urlString : String){
        guard let url = URL(string: urlString) else {return}
        let task = URLSession.shared.dataTask(with: url){data, response, error in
            guard  let data = data else{return}
            DispatchQueue.main.async {
                self.dataIsValid = true
                self.data = data
            }
        }
        task.resume()
    }
    //_ indica un parámetro que no es nombrado
    func imageFromData(_ data: Data)-> UIImage{
        //?? validar algo, si es nulo, lo retornas, si no retornas lo de la derecha
        UIImage(data: data) ?? UIImage()
    }
}
