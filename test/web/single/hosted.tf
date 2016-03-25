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
    provisioner "remote-exec" {
        connection {
            type = "ssh"
            user = "nnet"
            password = "nnet"
        }
        inline = [
        "sleep 30",
        "mkdir /home/nnet/.ssh",
        "chown nnet. /home/nnet/.ssh",
        "chmod 700 /home/nnet/.ssh",
        "cp -p /tmp/ssh/* /home/nnet/.ssh/",
        "ssh-keyscan github.com >> ~/.ssh/known_hosts",
        "sudo mv /var/www{,.org}",
        "sudo mkdir /var/www",
        "sudo chown -R nnet.nnet /var/www",
        "git clone git@github.com:rental/webcontent.git /var/www/",
        "cd /var/www/ ; git checkout ${var.commitid}"
        ]
    }
}
