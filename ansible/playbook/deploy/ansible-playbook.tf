resource "local_sensitive_file" "id_rsa" {
  filename = "id_rsa"
  content  = local.ssh_key.private_key_pem
}

resource "null_resource" "ansible-playbook" {

  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = "/usr/local/bin/ansible-playbook -i '${local.server_ipv4_address},' -u root --private-key id_rsa playbook.yaml"
    quiet = true
  }
}
