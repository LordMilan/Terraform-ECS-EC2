## Task for ECS Cluster is defined here ##
## API ##
resource "aws_ecs_task_definition" "task-definition-api" {
  family                = local.task_name_api
  container_definitions = file(local.path_api)
  network_mode          = "bridge"
  tags = {
    "env"       = "prod"
    "createdBy" = "milan"
  }
}

## UI ##
resource "aws_ecs_task_definition" "task-definition-ui" {
  family                = local.task_name_ui
  container_definitions = file(local.path_ui)
  network_mode          = "bridge"
  tags = {
    "env"       = "prod"
    "createdBy" = "milan"
  }
}