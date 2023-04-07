## Cluster is created here ##
resource "aws_ecs_cluster" "web-cluster" {
  name = local.cluster_name
}