resource "azure_instance" "web" {
    count = "${var.number_of_instance}" 
    name = "${var.vm_name}"
    image = "${var.vm_image}"
    size = "${var.vm_size}"
    storage_service_name = "${var.vm_storage_name}"
    location = "${var.vm_location}"
    username = "${var.vm_user}"
    password = "${var.vm_pass}"
    virtual_network = "${var.vm_virtual_network}"
    subnet = "${var.vm_subnet}"

    endpoint {
        name = "SSH"
        protocol = "tcp"
        public_port = 22
        private_port = 22
    }
    endpoint {
        name = "HTTP"
        protocol = "tcp"
        public_port = 80
        private_port = 80
    }

    provisioner "local-exec" {
        command = "/usr/bin/azure vm static-ip set ${var.vm_name} ${var.vm_ip}"
    }
}
