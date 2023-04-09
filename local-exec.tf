## Executing shell script to build image and push to ECR via Null Resource ##
## APP ##
resource "null_resource" "build_app" {
 provisioner "local-exec" {
    command = "sh build_push_to_ECR.sh > build_push_to_ECR.log 2>&1"
    interpreter = ["/bin/bash", "-c"]
    working_dir = "./build-files"
  }
}