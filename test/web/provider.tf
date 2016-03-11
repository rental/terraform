# Configure the Azure Provider
provider "azure" {
  publish_settings = "${file("/root/terraform/credentials.publishsettings")}"
}
