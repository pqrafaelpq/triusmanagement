using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descrição resumida de MateriaPrima
/// </summary>
/// 

namespace kifome.Classes
{
    public class MateriaPrima
    {
        //propriedades
        public int Codigo { get; set; }
        public string Nome { get; set; }
        public double Quantidade { get; set; }
        public string Descricao { get; set; }
        public string Status { get; set; }

        //construtor
        public MateriaPrima()
        {
            //
            // TODO: Adicionar lógica do construtor aqui
            //
        }
    }
}