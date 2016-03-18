# Configure the Azure Provider
provider "azure" {
  publish_settings = "${file("/var/lib/jenkins/credentials.publishsettings")}"
}
