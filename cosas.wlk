object knightRider {
    
    method peso() = 500
    method nivelDePeligrosidad() = 10
    
    method ocupaBulto() = 1

    method consecuenciaDeCarga(){

    }
}

object bumblebee {
    var estaTranformado = auto

    method peso() = 800
    method nivelDePeligrosidad() = estaTranformado.nivelDePeligrosidad()

    method cambiarTransformacion(unaTransformacion){
        estaTranformado = unaTransformacion
    }

    method ocupaBulto() = 2

    method consecuenciaDeCarga(){
        self.cambiarTransformacion(robot)
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

    method ocupaBulto(){
        if(cantidadDeLadrillos == 100){
            return 1
        }else if(cantidadDeLadrillos.between(101, 300)){
            return 2
        }else{
            return 3
        }
    }

    method consecuenciaDeCarga(){
        self.sumarLadrillos(12)
    }

}

object arenaAGranel {
    var peso = 0

    method sumarPeso(unPeso){
        peso = peso + unPeso
    }

    method restarPeso(unPeso){
        peso = peso - unPeso
    }

    method peso() = peso

    method nivelDePeligrosidad() = 1
    method ocupaBulto() = 1

    method consecuenciaDeCarga(){
        self.restarPeso(10)
    }
}

object bateriaAntiaerea {
    var estaConMisiles = false

    method peso() = self.pesoSegunMisiles()
    method nivelDePeligrosidad() = self.nivelDePeligrosidadSegunMisil()

    method pesoSegunMisiles(){
        if (estaConMisiles){
            return 300
        } else {
            return 200
        }
    }

    method cargarMisiles(){
        estaConMisiles = true
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

    method ocupaBulto() {
        if (estaConMisiles){
            return 2
        }else {
            return 1
        }
    }

    method consecuenciaDeCarga(){
        self.cargarMisiles()
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

    method bultosDentro(){
        return cosasDentro.sum({c=> c.ocupaBulto()})
    }
    method ocupaBulto(){
        return 1 + self.bultosDentro()
    }

    method consecuenciaDeCarga(){
        cosasDentro.forEach({c=> c.consecuenciaDeCarga()})
    }
}

object residuosRadioactivos {
    var peso = 0

    method nivelDePeligrosidad() = 200
    method peso() = peso

    method sumarPeso(unPeso){
        peso = peso + unPeso
    }

    method restarPeso(unPeso){
        peso = peso - unPeso
    }

    method ocupaBulto() = 1

    method consecuenciaDeCarga(){
        self.sumarPeso(15)
    }
}

object embalajeDeSeguridad {
    var cosaDentro = knightRider
    
    method peso() = cosaDentro.peso()

    method cambiarCosaEnvuelta(unaCosa){
        cosaDentro = unaCosa
    }

    method nivelDePeligrosidad() = cosaDentro.nivelDePeligrosidad() / 2
    method ocupaBulto() = 2

    method consecuenciaDeCarga(){
        
    }
}
