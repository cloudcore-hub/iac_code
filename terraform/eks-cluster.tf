module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = ">=20.0"

  cluster_name    = local.cluster_name
  cluster_version = "1.29"

  vpc_id = module.vpc.vpc_id 
  subnet_ids = module.vpc.private_subnets
  cluster_endpoint_public_access  = true

  eks_managed_node_group_defaults = {
    ami_type = "AL2_x86_64"
  }

  eks_managed_node_groups = {
    one = {
      name = "master-node-group"  

      instance_types = ["t2.medium"]

      min_size     = 1
      max_size     = 3
      desired_size = 2
    }

    two = {
      name = "worker-node-group"  

      instance_types = ["t2.medium"]

      min_size     = 1
      max_size     = 3
      desired_size = 2
    }
  }

}

  