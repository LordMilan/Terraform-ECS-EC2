locals {
  #TG#
  tg_name_api             = "${local.task_name_api}-tg"
  tg_name_ui              = "${local.task_name_ui}-tg"

  ## Task Defn ##
  awslogs-group_api       = local.log_group_name_api
  awslogs-group_ui        = local.log_group_name_ui

  ## Values for ECS Service ##
  container_name_api      = local.task_name_api
  container_name_ui       = local.task_name_ui

  ## Values for ASG and Capacity Provider##
  ec2-sg-name             = "${local.asg_configname}-ec2-sg"
  capacity_provider_name  = "${local.asg_configname}-CP"

  ## Values for ECS Service ##
  service_name_api        = "${local.task_name_api}-service"
  service_name_ui         = "${local.task_name_ui}-service"

  ## Values for CloudWatch Log Group Names ##
  log_group_name_api      = "/ecs/${local.task_name_api}"
  log_group_name_ui       = "/ecs/${local.task_name_ui}"
  
  ## IAM ##
  iam_role_name_for_creating_EC2 = "ecs-instance-role-${local.asg_configname}"
  
}