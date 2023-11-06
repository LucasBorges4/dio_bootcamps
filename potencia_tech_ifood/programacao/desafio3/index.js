class Heroi {
    constructor(nome, idade, tipo) {
        this.nome = nome;
        this.idade = idade;
        this.tipo = tipo;
    }

    atacar() {
        console.log(`O ${this.tipo} atacou usando um ataque genérico`);
    }
}

class Guerreiro extends Heroi {
    atacar() {
        console.log(`O ${this.tipo} atacou usando uma espada`);
    }
}

class Mago extends Heroi {
    atacar() {
        console.log(`O ${this.tipo} atacou usando magia`);
    }
}

class Monge extends Heroi {
    atacar() {
        console.log(`O ${this.tipo} atacou usando artes marciais`);
    }
}

class Ninja extends Heroi {
    atacar() {
        console.log(`O ${this.tipo} atacou usando shuriken`);
    }
}

const guerreiro = new Guerreiro("Aragorn", 30, "guerreiro");
const mago = new Mago("Gandalf", 50, "mago");
const monge = new Monge("Bruce Lee", 35, "monge");
const ninja = new Ninja("Hanzo", 25, "ninja");

guerreiro.atacar();
mago.atacar();      
monge.atacar();    
ninja.atacar(); 
