output "ubuntu_ami_id" {
  value = data.aws_ami.latest-ubuntu-image.id
}
