region = "{your-region}"

tags = {
  name = "[your-preferred-nametag]"
}

bucket_names = [
  "{your-bucket-name1}",
  "{your-bucket-name2}"
]

vpc_cidr = "10.0.0.0/16"

public_subnet_1_cidr  = "10.0.1.0/24"
public_subnet_2_cidr  = "10.0.3.0/24"
private_subnet_1_cidr = "10.0.2.0/24"
private_subnet_2_cidr = "10.0.4.0/24"

EC2_AMI  = "ami-0e18fe6ecdad223e5"
EC2_size = "t3.micro"


# ---------- Adjustable Setting ----------
# region: ap-northeast-2
# EC2 AMI: Amazon Linux 2 AMI (HVM), SSD Volume Type
# t3micro             = "ami-0e18fe6ecdad223e5"
# t3small             = "ami-011fb2b8814373313"
# c6g4xlargeAMI     = "ami-090a5c6f86b8b8c75"
# win_2016_corebase = "ami-05834e674b5546f29"


