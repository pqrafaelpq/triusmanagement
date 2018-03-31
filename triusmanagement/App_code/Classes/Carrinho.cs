using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace kifome.Classes
{
    /// <summary>
    /// Descrição resumida de Carrinho
    /// </summary>
    public class Carrinho
    {
        public int Codigo { get; set; }        
        public string Produto { get; set; }
        public int Quantidade { get; set; }
        public double Valor { get; set; }        
        
        
        public Carrinho()
        {
            //
            // TODO: Adicionar lógica do construtor aqui
            //
        }
    }
}