using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descrição resumida de Funcionario
/// </summary>
/// 

namespace kifome.Classes
{

    public class Funcionario
    {
        //propriedades
        public int Codigo { get; set; }
        public string Nome { get; set; }
        public string Email { get; set; }
        public string Senha { get; set; }
        public int Tipo { get; set; }
        public double Salario { get; set; }
        public string Cracha { get; set; }
        public bool Status { get; set; }

        //construtor
        public Funcionario()
        {
            //
            // TODO: Adicionar lógica do construtor aqui
            //
        }
    }
}