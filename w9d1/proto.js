function inherits(ParentClass, ChildClass){
    function Surrogate(){

    }

    Surrogate.prototype = ParentClass.prototype;
    ChildClass.prototype = new Surrogate();
    ChildClass.prototype.constructor = ChildClass;

}

ChildClass.prototype = Object.create(ParentClass.prototype)
inherits()