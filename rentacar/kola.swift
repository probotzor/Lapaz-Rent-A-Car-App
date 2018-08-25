


import Foundation

class Kola {
    private var _id: Int!
    private var _model: String!
    private var _gorivo: String!
    private var _brojvrata: Int!
    private var _cena: Int!
    
    var id: Int {
        return _id
    }
    
    var model: String {
        return _model
    }
    
    var gorivo: String {
        return _gorivo
    }
    
    var brojvrata: Int {
        return _brojvrata
    }
    
    var cena: Int {
        return _cena
    }
    
    
    
    init(id: Int, model: String, gorivo: String, brojvrata: Int, cena: Int) {
        self._id = id
        self._model = model
        self._gorivo = gorivo
        self._brojvrata = brojvrata
        self._cena = cena
        
    }
}
