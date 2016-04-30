
import UIKit

enum Velocidad : Int{
    case Apagado = 0
    case velocidadBaja = 20
    case velocidadMedia = 50
    case velocidadAlta = 120
    init (velocidadInicial : Velocidad) {
        self = .Apagado
    }
    mutating func next() {
        switch self {
        case .Apagado:
            self = .velocidadBaja
        case .velocidadBaja:
            self = .velocidadMedia
        case .velocidadMedia:
            self = .velocidadAlta
        case .velocidadAlta:
            self = .velocidadMedia
        }
    }
}

class Auto {
    var velocidad : Velocidad
    
    init() {
        velocidad = Velocidad.Apagado
    }
    func cambioDeVelocidad( ) -> ( actual : Int, velocidadEnCadena: String){
        let velocidadActual = velocidad
        
        velocidad.next()
        
        return (actual : velocidadActual.rawValue, velocidadEnCadena : "\(velocidadActual)")
    }
}

var auto = Auto()

auto.velocidad


for _ in 1...20 {
    let dato = auto.cambioDeVelocidad()
    print(dato)
}