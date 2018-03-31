using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descrição resumida de Produto
/// </summary>
/// 

namespace kifome.Classes
{
    public class Produto
    {
        //propriedades
        public int Codigo { get; set; }
        public string Nome { get; set; }
        public Int32 Quantidade { get; set; }
        public double ValorCento { get; set; }
        public string Descricao { get; set; }
        public string Status { get; set; }

        //construtor
        public Produto()
        {
            //
            // TODO: Adicionar lógica do construtor aqui
            //
        }
    }
}