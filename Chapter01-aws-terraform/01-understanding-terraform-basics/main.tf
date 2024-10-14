resource "random_string" "random" {
  length = 2

  # you cannot randomly generate a number, this provider does not support it
#   random_num = 3
}


# random Provider in Terraform
# The random provider is a Terraform provider that generates random values using a cryptographic random number generator.