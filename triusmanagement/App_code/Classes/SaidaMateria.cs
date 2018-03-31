using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descrição resumida de SaidaMateria
/// </summary>
/// 
namespace kifome.Classes
{
    public class SaidaMateria
    {
        //propriedades
        public int Codigo { get; set; }
        public string Materia { get; set; }
        public int Quantidade { get; set; }
        public DateTime Data { get; set; }
        public string Funcionario { get; set; }

        //construtor
        public SaidaMateria()
        {
            //
            // TODO: Adicionar lógica do construtor aqui
            //
        }
    }
}