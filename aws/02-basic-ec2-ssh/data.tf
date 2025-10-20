# Podemos recoger el dato de AWS, en este caso recogemos el dato de key pair ya creado en la cuenta de AWS
data "aws_key_pair" "key" {
  key_name = "keyPrincipal"  # El nombre exacto de la key pair que creaste manualmente
}
