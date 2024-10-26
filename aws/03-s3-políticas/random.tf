# Este recursos nos permite crear elementos aleatorios
resource "random_string" "random" {
  length  = 7 # longitud de los elementos
  special = false # Desactivamos los caracteres especiales ya que puede causar problemas en este caso con S3
  upper = false # Los S3 tienen que tene los caracteres en minúsculas
  numeric = true
}
