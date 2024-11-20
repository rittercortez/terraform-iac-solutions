graph TD
    
        direction TB

        IGW["Internet Gateway (IGW)"]
        NATGW["NAT Gateway (NGW)<br>+ Elastic IP"]
        
        RT_Public["Route Table (Public)"]
        RT_Private["Route Table (Private)"]
        
        Subnet_Public_1["Public Subnet 1:<br>public-app<br>(var.subnet_public)"]
        Subnet_Public_2["Public Subnet 2:<br>public-db<br>(var.subnet_public)"]
        Subnet_Private_1["Private Subnet 1:<br>private-app<br>(var.subnet_private)"]
        Subnet_Private_2["Private Subnet 2:<br>private-db<br>(var.subnet_private)"]
        
        %% Associations
        Subnet_Public_1 -->|Route Table Association| RT_Public
        Subnet_Public_2 -->|Route Table Association| RT_Public
        RT_Public -->|0.0.0.0/0| IGW

        Subnet_Private_1 -->|Route Table Association| RT_Private
        Subnet_Private_2 -->|Route Table Association| RT_Private
        RT_Private -->|0.0.0.0/0| NATGW
    