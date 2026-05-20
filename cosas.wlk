object knightRider {
    
    method peso() = 500
    method nivelDePeligrosidad() = 10
    
}

object bumblebee {
    var estaTranformado = auto

    method peso() = 800
    method nivelDePeligrosidad() = estaTranformado.nivelDePeligrosidad()

    method cambiarTransformacion(unaTransformacion){
        estaTranformado = unaTransformacion
    }
}
//---- objetos para boomblebee
object auto {
  
  method nivelDePeligrosidad() = 30
}
object robot {
  
  method nivelDePeligrosidad() = 15
}
//----

object paqueteDeLadrillos {
    var cantidadDeLadrillos = 0

    method nivelDePeligrosidad() = 2

    method pesoPorUnidad() = 2

    method peso() = cantidadDeLadrillos * self.pesoPorUnidad()

    method sumarLadrillos(unaCantidad){
        cantidadDeLadrillos = cantidadDeLadrillos + unaCantidad
    }

    method quitarLadrillos(unaCantidad){
        cantidadDeLadrillos = cantidadDeLadrillos - unaCantidad
    }
}

object arenaAGranel {
    var peso = 0

    method pesoNuevo(unPeso){
        peso = unPeso
    } 

    method peso() = peso

    method nivelDePeligrosidad() = 1

}

object bateriaAntiaerea {
    var estaConMisiles = true

    method peso() = self.pesoSegunMisiles()
    method nivelDePeligrosidad() = self.nivelDePeligrosidadSegunMisil()

    method pesoSegunMisiles(){
        if (estaConMisiles){
            return 300
        } else {
            return 200
        }
    }

    method sacarMisiles(){
        estaConMisiles = false
    }

    method nivelDePeligrosidadSegunMisil(){
        if (estaConMisiles){
            return 100
        }else{
            return 0
        }
    }
}

object conetendorPortuario {
    const cosasDentro = []

    method agregarCosaAlContenedor(unaCosa){
        cosasDentro.add(unaCosa)
    }
    method sacarCosasDelContenedor(unaCosa) {
      cosasDentro.remove(unaCosa)
    }

    method peso() = 100 + self.sumaDeCosasDentro()

    method sumaDeCosasDentro(){
        return cosasDentro.sum({c=> c.peso()})
    }

    method cosaMssPeligrosa(){
        return cosasDentro.map({c=> c.nivelDePeligrosidad()})
    }

    method nivelDePeligrosidad(){
        if (not cosasDentro.isEmpty()){
            return self.cosaMssPeligrosa().max()
        }else{
            return 0
        }
    }
}

object residuosRadioactivos {
    var peso = 0

    method nivelDePeligrosidad() = 200
    method peso() = peso

    method nuevoPeso(unPeso){
        peso = unPeso
    }
}

object embalajeDeSeguridad {
    var cosaDentro = knightRider
    
    method peso() = cosaDentro.peso()

    method cambiarCosaEnvuelta(unaCosa){
        cosaDentro = unaCosa
    }

    method nivelDePeligrosidad() = cosaDentro.nivelDePeligrosidad() / 2
}
