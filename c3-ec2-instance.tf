resource "aws_instance" "my-ec2-vm" {
    ami = data.aws_ami.amzlinux.id
    instance_type = var.instance_type
    count =1
    key_name = "jenkins-key"
    user_data = file("apache-install.sh")
    vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]
    tags = {
        "Name" = "Terraform-cloud-${count.index}"
    }
}