#### Titel:  
#### Date:   
#### Autor: 
#### Keywords:  

--------------------


## <Step 1> - Delete security group

    aws ec2 delete-security-group --group-id sg-e1XXXXXX..


## <Step 2> - Delete subnets

    aws ec2 delete-subnet --subnet-id subnet-b4XXXXXX..
    aws ec2 delete-subnet --subnet-id subnet-a4XXXXXX..


## <Step 3> - Delete custom route table

    aws ec2 delete-route-table --route-table-id rtb-c1XXXXX..


## <Step 4> - Detach internet gateway from VPC

    aws ec2 detach-internet-gateway --internet-gateway-id igw-1fXXXXXX.. --vpc-id vpc-2fXXXXX..


## <Step 5> - Delete internet gateway

    aws ec2 delete-internet-gateway --internet-gateway-id igw-1fXXXXXX..


## <Step 6> - Delete VPC

    aws ec2 delete-vpc --vpc-id vpc-2fXXXXX..
    


