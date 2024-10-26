variable "regiones" {
    description = "Regiones de AWS"
    type = map(string)
}
variable "usuarios"{
    description = "Usuarios de AWS"
    type = list(string)
}
variable "buckets"{
    description = "Recursos necesarios para los buckets"
    type = object({
      bucket_versioning_key = string 
      bucket_versioning_source = string
      bucket_logging_prefix = list(string)
      tags = map(string)
    })
}
variable "policys" {
    description = "Recursos para la políticas"
    type = object({
      policy_access_type = string
      policy_access_actions = object({
        read_writte = list(string)
        read = list(string)
      })
    })
  
}
