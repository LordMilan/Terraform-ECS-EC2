## Task for ECS Cluster is defined here ##

## API ##
resource "aws_ecs_task_definition" "task-definition-api" {
  family                = local.task_name_api
  container_definitions = file(local.path, {
    container_name    = "prod-enrollible-msg-center-API"
    awslogs-group     = "/ecs/qa-enrollible-msg-center-api"
    awslogs-region    = "ap-south-1"
    containerPort     = "80"
    cpu               =  "0"
    memoryReservation = "256"
    log_driver        = "awslogs"
    essential         = "true"
    ecr_image         = "551804445178.dkr.ecr.ap-south-1.amazonaws.com/qa-api:qa-enrollible-msg-center-api"
  })
  network_mode          = "bridge"
  tags = {
    "env"       = "prod"
    "createdBy" = "milan"
  }
}

## UI ##
resource "aws_ecs_task_definition" "task-definition-ui" {
  family                = local.task_name_ui
  container_definitions = file(local.path, {
    container_name    = "prod-enrollible-msg-center-UI"
    awslogs-group     = "/ecs/qa-enrollible-msg-center-ui"
    awslogs-region    = "ap-south-1"
    containerPort     = "80"
    cpu               =  "0"
    memoryReservation = "256"
    log_driver        = "awslogs"
    essential         = "true"
    ecr_image         = "551804445178.dkr.ecr.ap-south-1.amazonaws.com/qa-ui:qa-enrollible-msg-center-ui"
  })
  network_mode          = "bridge"
  tags = {
    "env"       = "prod"
    "createdBy" = "milan"
  }
}