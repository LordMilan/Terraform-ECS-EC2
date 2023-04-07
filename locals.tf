locals {
  key_name                = "enrollible-msg-center-prod"

  ## Values for VPC. VPC is not created by terraform here ##
  vpc_id                  = "vpc-a82893cd"
  public_subnets          = ["subnet-f8c8108f","subnet-066c975f","subnet-e47268cc"]
  
  ## Values for ALB, Listeners and target Groups. ALB and Listener is not created by Terraform here ##
   #ALB#
  alb_arn                 = "arn:aws:elasticloadbalancing:us-east-1:551804445178:loadbalancer/app/Halopay-BlueGreen-Production/f94dae1570ae78a9"
  alb_sg_id               = "sg-7b5d6f1e"
  alb_listener_arn        = "arn:aws:elasticloadbalancing:us-east-1:551804445178:listener/app/Halopay-BlueGreen-Production/f94dae1570ae78a9/46d3ac22a81d48e6"
   
   #TG#
  tg_name_api             = "prod-enroll-msg-center-api-tg"
  api_url                 = "prod-api-message.enrollible.com"

  tg_name_ui              = "prod-enroll-msg-center-ui-tg"
  ui_url                  = "prod-message.enrollible.com"

  ## Values for ASG and Capacity Provider##
  asg_configname          = "prod-msg-center"
  min_size                  = 1
  max_size                  = 3
  desired_capacity          = 1

  ecs_instance_type       = "t3a.micro"
  ec2-sg-name             = "prod-msg-center-ec2-sg"

  capacity_provider_name  = "prod-msg-center-cluster-CP"
 
  ## Values for CloudWatch Log Group Names ##
  log_group_name_api      = "/ecs/prod-enrollible-msg-center-api"
  log_group_name_ui       = "/ecs/prod-enrollible-msg-center-ui"
  
  ## Values for ECS Task Definition ##
   #API#
  task_name_api           = "prod-enrollible-msg-center-API"
  ecr_image_api           = "551804445178.dkr.ecr.ap-south-1.amazonaws.com/qa-api:qa-enrollible-msg-center-api"
  awslogs-group_api       = local.log_group_name_api
  cpu_api                 = 0
  memoryReservation_api   = 256

   #UI#
  task_name_ui            = "prod-enrollible-msg-center-UI"
  ecr_image_ui            = "551804445178.dkr.ecr.ap-south-1.amazonaws.com/qa-ui:qa-enrollible-msg-center-ui"
  awslogs-group_ui        = local.log_group_name_ui
  cpu_ui                  = 0
  memoryReservation_ui    = 256

   #Common#
  log_driver              = "awslogs"
  network_mode            = "bridge"
  essential               = "true"
  awslogs-region          = "us-east-1"

  ## Values for ECS Service ##
  service_name_api        = "prod-enrollible-msg-center-api-service"
  container_numbers_api   = 1
  container_name_api      = "prod-enrollible-msg-center-API"
  container_port_api      = 80
  
  service_name_ui         = "prod-enrollible-msg-center-ui-service"
  container_numbers_ui    = 1
  container_name_ui       = "prod-enrollible-msg-center-UI"
  container_port_ui       = 80

  ## IAM ##
  iam_role_name_for_creating_EC2 = "ecs-instance-role-prod-enroll-msg-center"

  ## Container_definition File path ##
  path                    = "container-definitions/container_defn.json"

  ## local-exec script files names ##
   #Go to local-exec.tf and rename the files as required #

}
