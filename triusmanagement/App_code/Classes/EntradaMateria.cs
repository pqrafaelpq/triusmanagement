using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descrição resumida de EntradaMateria
/// </summary>
/// 

namespace kifome.Classes
{
    public class EntradaMateria
    {
        //propriedades
        public int Codigo { get; set; }
        public string Nome { get; set; }
        public int Quantidade { get; set; }
        public string Descricao { get; set; }
        public double Valor { get; set; }
        public DateTime Data { get; set; }
        public string Funcionario { get; set; }

        //construtor
        public EntradaMateria()
        {
            //
            // TODO: Adicionar lógica do construtor aqui
            //
        }
    }
}