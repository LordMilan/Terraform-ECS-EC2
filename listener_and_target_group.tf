
## Target Group for API is created here ##
resource "aws_lb_target_group" "lb_target_group_api" {
  name        = local.tg_name_api
  port        = "80"
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = data.aws_vpc.existing.id
  health_check {
    path                = "/"
    healthy_threshold   = 2
    unhealthy_threshold = 3
    timeout             = 60
    interval            = 300
    matcher             = "200,301,302"
  }
}

## Listener Rule for API is created here ##
resource "aws_lb_listener_rule" "api" {
 depends_on = [local.alb_listener_arn]
    lifecycle {
    create_before_destroy = true
  }
  listener_arn = local.alb_listener_arn
  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lb_target_group_api.arn
  }
  condition {
    host_header {
      values = ["${local.api_url}"]
    }
  }
  # condition {
  #   path_pattern {
  #     values = ["/your_path"]
  #   }
  # }
}

## Target Group for UI is created here ##
resource "aws_lb_target_group" "lb_target_group_ui" {
  name        = local.tg_name_ui
  port        = "80"
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = data.aws_vpc.existing.id
  health_check {
    path                = "/"
    healthy_threshold   = 2
    unhealthy_threshold = 10
    timeout             = 60
    interval            = 300
    matcher             = "200,301,302"
  }
}

## Listener Rule for UI is created here ##
resource "aws_lb_listener_rule" "ui" {
 depends_on = [local.alb_listener_arn]
    lifecycle {
    create_before_destroy = true
  }
  listener_arn = local.alb_listener_arn
  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lb_target_group_ui.arn
  }
  condition {
    host_header {
      values = ["${local.ui_url}"]
    }
  }
  # condition {
  #   path_pattern {
  #     values = ["/your_path"]
  #   }
  # }
}