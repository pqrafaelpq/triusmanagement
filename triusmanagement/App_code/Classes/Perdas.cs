using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace kifome.Classes
{
    /// <summary>
    /// Descrição resumida de Perdas
    /// </summary>
    public class Perdas
    {
        public string Produto { get; set; }
        public int Quantidade { get; set; }
        public DateTime Data { get; set; }
        public string PedCodigo { get; set; }
        public string Motivo { get; set; }

        //construtor
        public Perdas()
        {
            //
            // TODO: Adicionar lógica do construtor aqui
            //
        }
    }
}