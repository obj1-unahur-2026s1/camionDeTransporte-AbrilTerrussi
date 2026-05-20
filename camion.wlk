object camion {
    
    const cosas=[]

    method cargarCosas(unaCosa){
        cosas.add(unaCosa)
    }

    method descargarCosas(unaCosa){
        cosas.remove(unaCosa)
    }

    method pesoTara() = 1000

    method peso(){
        return self.pesoTotalDeCosas() + self.pesoTara()
    } 

    method pesoTotalDeCosas(){
        return cosas.sum({c=> c.peso()})
    }

    method sonPares(){
        return cosas.all({c=> c.peso().even()})
    }

    method hayCosaDePeso(unPeso){
        return cosas.any({c=> c.peso() == unPeso})
    }

    method cosaConNivelDePeligrosidad(unNivel) {
        return cosas.find({c=> c.nivelDelPeligrosidad() == unNivel})
    }

    method cosasQueSuperanNivelDePeligro(unNivel){
        return cosas.filter({c=> c.nivelDePeligrosidad() > unNivel})
    }

    method cosasQueSuperarNivelDePeligroDe(unaCosa){
        return cosas.filter({c=> c.nivelDePeligrosidad() > unaCosa.nivelDePeligrosidad()})
    }

    method estaExcedidoDePeso() = self.peso() > 2500

    method puedeCircularEnRuta(unNivel) {
        return not self.estaExcedidoDePeso() && 
        cosas.all({c=> c.nivelDePeligrosisad() < unNivel})
        //self.cosasQueSuperanNivelDePeligro(unNivel).isEmpty()
    }
}