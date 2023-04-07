locals {
  key_name                = "enrollible-msg-center-prod"

  ## VPC ##
  vpc_id                  = "vpc-a82893cd"
  public_subnets          = ["subnet-f8c8108f","subnet-066c975f","subnet-e47268cc"]
  
  ## ALB ##
  tg_name_api             = "prod-enroll-msg-center-api-tg"
  tg_name_ui              = "prod-enroll-msg-center-ui-tg"
  alb_arn                 = "arn:aws:elasticloadbalancing:us-east-1:551804445178:loadbalancer/app/Halopay-BlueGreen-Production/f94dae1570ae78a9"
  alb_listener_arn        = "arn:aws:elasticloadbalancing:us-east-1:551804445178:listener/app/Halopay-BlueGreen-Production/f94dae1570ae78a9/46d3ac22a81d48e6"
  ui_url                  = "prod-message.enrollible.com"
  api_url                 = "prod-api-message.enrollible.com"

  ## ASG ##
  alb_sg_id               = "sg-7b5d6f1e"
  ecs_instance_type       = "t3a.micro"
  asg_configname          = "prod-msg-center"
  ec2-sg-name             = "prod-msg-center-ec2-sg"
  capacity_provider_name  = "prod-msg-center-cluster-CP"
 
  ## CloudWatch ##
  log_group_name_api      = "/ecs/prod-enrollible-msg-center-api"
  log_group_name_ui       = "/ecs/prod-enrollible-msg-center-ui"
  
  ## ECS Tasks ##
  task_name_ui            = "prod-enrollible-msg-center-UI"
  task_name_api           = "prod-enrollible-msg-center-API"

  ## ECS Service ##
  service_name_api        = "prod-enrollible-msg-center-api-service"
  service_name_ui         = "prod-enrollible-msg-center-ui-service"
  container_numbers_ui    = 1
  container_numbers_api   = 1
  container_name_api      = "prod-enrollible-msg-center-API"
  container_port_api      = 80
  container_name_ui       = "prod-enrollible-msg-center-UI"
  container_port_ui       = 80

  ## IAM ##
  iam_role_name_for_creating_EC2 = "ecs-instance-role-prod-enroll-msg-center"

  #Container_definition File path##
  path                = "container-definitions/container_defn.json"

  #local-exec script files names##
  # Go to local-exec.tf and rename the files as required #

}
