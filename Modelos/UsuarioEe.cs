using System;

namespace Modelos
{
    public class UsuarioEe
    {
		public int IdUsuario { get; set; }
		public string CodTrabajador { get; set; }
		public string Nombres { get; set; }
		public string Apellidos { get; set; }
		public string Clave { get; set; }
		public DateTime FecIngreso { get; set; }
		public string Aleas { get; set; }
		public bool Activo { get; set; }
		public string ClaveEncriptada { get { return new Utilitarios.Encriptacion().Encode(Clave); } }
		public string ClaveDesencriptada { get { return new Utilitarios.Encriptacion().Decode(Clave); } }
		public enum Status
        {
			Ninguno=0,
			Insert=1,
			Update=2,
			Delete=3,
        }
		public enum Busqueda
        {
			Todo=0,
			PorIdUsuario=1,
			PorCodigoTrabajador=2,
			PornombreApellido=3,
        }
	}
}
