using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace kifome.Classes
{
    /// <summary>
    /// Descrição resumida de Pedido
    /// </summary>
    public class Pedido
    {
        //propriedades
        public int Codigo { get; set; }
        public string NomeCliente { get; set; }
        public string ContatoCliente { get; set; }        
        public string Produto { get; set; }
        public int QuantidadeTotal { get; set; }
        public double ValorTotal { get; set; }        
        public string Status { get; set; }
        public DateTime DataEntrada { get; set; }
        public DateTime DataPronto { get; set; }
        public DateTime DataPrevista { get; set; }
        public int QtdDias { get; set; }
        public int Cont { get; set; }

        //construtor
        public Pedido()
        {
            //
            // TODO: Adicionar lógica do construtor aqui
            //
        }
    }
}