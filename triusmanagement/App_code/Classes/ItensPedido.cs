using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace kifome.Classes
{
    /// <summary>
    /// Descrição resumida de ItensPedido
    /// </summary>
    public class ItensPedido
    {
        //propriedades
        public int Codigo { get; set; }
        public string Produto { get; set; }
        public int Quantidade { get; set; }
        public string PedCodigo { get; set; }
        public DateTime Data { get; set; }
        public string Status { get; set; }

        //construtor
        public ItensPedido()
        {
            //
            // TODO: Adicionar lógica do construtor aqui
            //
        }
    }
}