using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace c_.Models
{
    public class Pessoa
    {
        public string Nome {get; set;}
        public int Idade {get; set;}

        public void Apresentar(){
            Console.Write($"Olá, meu nome é {Nome}, e tenho {Idade}\n");
        }
    }
}