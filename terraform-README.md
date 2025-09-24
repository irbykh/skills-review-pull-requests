# Azure Infrastructure with Terraform

This Terraform configuration creates Azure infrastructure with the following components:

## Architecture Overview

### Hub Virtual Network
- **VNet Name**: `vnet-hub-east`
- **CIDR**: `10.0.0.0/16`
- **Subnets**:
  - `snet-trust-east`: `10.0.1.0/24`

### Identity Virtual Network
- **VNet Name**: `vnet-idnt-east`
- **CIDR**: `192.168.1.0/16`
- **Subnets**:
  - `snet-idnt-infra-east`: `192.168.1.0/24`
  - `snet-idnt-dns-inbound-east`: `192.168.2.0/24`
  - `snet-idnt-dns-outbound-east`: `192.168.3.0/24`

### Load Balancer
- **Name**: `ilb-hub-trust-east`
- **Type**: Internal Standard Load Balancer
- **Frontend IP**: Dynamic allocation in trust subnet
- **Health Probe**: TCP port 22
- **Load Balancing Rule**: Port 22 traffic distribution

### VNet Peering
- Bidirectional peering between Hub and Identity VNets
- Enables cross-VNet communication

### Private DNS Resolver
- **Name**: `prs-idnt-dns-east`
- **Location**: Identity VNet
- **Inbound Endpoint**: Dynamic IP in `snet-idnt-dns-inbound-east`
- **Outbound Endpoint**: Configured in `snet-idnt-dns-outbound-east`

## Module Structure

The infrastructure is organized into reusable Terraform modules:

- `modules/hub-vnet/` - Hub virtual network and trust subnet
- `modules/identity-vnet/` - Identity virtual network with three subnets
- `modules/load-balancer/` - Internal load balancer with health probes
- `modules/vnet-peering/` - VNet peering configuration
- `modules/private-dns-resolver/` - Private DNS resolver with endpoints

## Usage

1. **Initialize Terraform**:
   ```bash
   terraform init
   ```

2. **Validate configuration**:
   ```bash
   terraform validate
   ```

3. **Plan deployment**:
   ```bash
   terraform plan
   ```

4. **Apply configuration**:
   ```bash
   terraform apply
   ```

## Outputs

The configuration provides the following outputs:
- Hub VNet ID
- Identity VNet ID
- Load balancer frontend IP address
- Private DNS resolver ID
- DNS inbound endpoint IP
- DNS outbound endpoint IP

## Resource Groups

Two resource groups are created:
- `rg-hub-east` - Contains Hub VNet and load balancer
- `rg-identity-east` - Contains Identity VNet and DNS resolver