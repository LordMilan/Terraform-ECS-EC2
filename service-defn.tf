## Service for ECS Cluster(API) is defined here ##
## API ##
resource "aws_ecs_service" "service_api" {
  name            = local.service_name_api
  cluster         = aws_ecs_cluster.web-cluster.id
  task_definition = aws_ecs_task_definition.task-definition-api.arn
  desired_count   = local.container_numbers_api
  ordered_placement_strategy {
    type  = "binpack"
    field = "cpu"
  }
  load_balancer {
    target_group_arn = aws_lb_target_group.lb_target_group_api.arn
    container_name   = local.container_name_api
    container_port   = local.container_port_api
  }
  # Optional: Allow external changes without Terraform plan difference(for example ASG)
  lifecycle {
    ignore_changes = [desired_count]
  }
  launch_type = "EC2"
  depends_on  = [aws_lb_target_group.lb_target_group_api]
}



## Service for ECS Cluster(UI) is defined here ##
## UI ##
resource "aws_ecs_service" "service_ui" {
  name            = local.service_name_ui
  cluster         = aws_ecs_cluster.web-cluster.id
  task_definition = aws_ecs_task_definition.task-definition-ui.arn
  desired_count   = local.container_numbers_ui
  ordered_placement_strategy {
    type  = "binpack"
    field = "cpu"
  }
  load_balancer {
    target_group_arn = aws_lb_target_group.lb_target_group_ui.arn
    container_name   = local.container_name_ui
    container_port   = local.container_port_ui
  }
  # Optional: Allow external changes without Terraform plan difference(for example ASG)
  lifecycle {
    ignore_changes = [desired_count]
  }
  launch_type = "EC2"
  depends_on  = [aws_lb_target_group.lb_target_group_ui]
}
