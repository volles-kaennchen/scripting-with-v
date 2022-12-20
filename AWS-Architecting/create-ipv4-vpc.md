#### Titel:  
#### Date:   
#### Autor: 
#### Keywords:  

--------------------


# Create VPC with IPv4


## Open the Cloud9 IDE on the AWS - Cloud9 Panel. Open new Terminal. 


## <Step 1> - Create vpc

    aws ec2 create-vpc --cidr-block 10.0.0.0/16 --query Vpc.VpcId --output text
    <-- output vpc-0424XXXXXX... | save for later! -->


## <Step 2> - Create subnet

    aws ec2 create-subnet --vpc-id vpc-0424XXXXXX.. --cidr-block 10.0.1.0/24
    aws ec2 create-subnet --vpc-id vpc-0424XXXXXX.. --cidr-block 10.0.0.0/24


## <Step 3> - Make subnet public 

    aws ec2 create-internet-gateway --query InternetGateway.InternetGatewayId --output text
    <-- output igw-0c24XXXXXX.. | save for later! -->


## <Step 4> - Attach gateway to vpc 

    aws ec2 attach-internet-gateway --vpc-id vpc-0424XXXXXX.. --internet-gateway-id igw-0c24XXXXXX..


## <Step 5> - Create route table

    aws ec2 create-route-table --vpc-id vpc-0424XXXXXX.. --query RouteTable.RouteTableId --output text
    <-- output rtb-014XXXXXXX.. | save for later! -->


## <Step 6> - Create route on route-table 

    aws ec2 create-route --route-table-id rtb-014XXXXXXX.. --destination-cidr-block 0.0.0.0/0 --gateway-id igw-0c24XXXXXX..
    <-- output "return: true" -->


## <Step 7> - Describe route-table 

    aws ec2 describe-route-tables --route-table-id rtb-014XXXXXXX..


## <Step 8> - Associate route table with vpc subnet

    aws ec2 describe-subnets --filters "Name=vpc-id,Values=vpc-0424XXXXXX.." --query "Subnets[*].{ID:SubnetId,CIDR:CidrBlock}"
    <-- output each subnet-0e7XXXXX.. and subnet-0a8XXXXX.. | save for later! -->


## <Step 9> - Associate subnet 

    aws ec2 associate-route-table  --subnet-id subnet-0e7XXXXX.. --route-table-id rtb-014XXXXXXX..
    aws ec2 associate-route-table  --subnet-id subnet-0a8XXXXX.. --route-table-id rtb-014XXXXXXX..


## <Step 10> - Modifiy public ip adress

    aws ec2 modify-subnet-attribute --subnet-id subnet-0e7XXXXX. --map-public-ip-on-launch
    aws ec2 modify-subnet-attribute --subnet-id subnet-0a8XXXXX.. --map-public-ip-on-launch


## <Step 11> - Create key-pair 

    aws ec2 create-key-pair --key-name ENTER-KEYNAME --query "KeyMaterial" --output text > ENTER-KEYNAME.pem


## <Step 10> - Launch instance via pem

    chmod 400 ENTER-KEYNAME.pem


## <Step 11> - Create security group 

    aws ec2 create-security-group --group-name SSHAccess --description "Security group for SSH access" --vpc-id vpc-0424XXXXXX..
    <-- output sg-06fxxxxxxx.. |  save for later! -->


## <Step 12> - Allow ssh 

    aws ec2 authorize-security-group-ingress --group-id sg-e1fb8c9a --protocol tcp --port 22 --cidr 0.0.0.0/0


## <Step 13> - Ami lookup

    aws ec2 describe-images --owners amazon --filters "Name=name, Values=amzn2-ami-hvm-2.0.????????.?-x86_64-gp2" "Name=state, Values=available" --query "reverse(sort_by(Images, &Name))[:1].ImageId" --output text 
    <-- output ami-0b9xxxxxxx.. |  save for later! -->


## <Step 14> - Launch instance to public subnet

    aws ec2 run-instances --image-id ami-0b9xxxxxxx.. --count 1 --instance-type t2.micro --key-name ENTER-KEYNAME --security-group-ids sg-06fxxxxxxx.. --subnet-id subnet-0e7XXXXX..


## <Step 15> - Check instance id on AWS EC2 by searching with sg-06fxxxxxxx..


## <Step 16> - Check state and ip adress

    aws ec2 describe-instances --instance-id i-021xxxxxx.. --query "Reservations[*].Instances[*].{State:State.Name,Address:PublicIpAddress}"
    <-- output instance state and ip adress | save ip adress for later! -->


## <Step 17> - Connect with ssh

    ssh -i "ENTER-KEYNAME.pem" ec2-user@52.XX.XXX.XX
    <-- enter: yes | connection should be stablish -->
