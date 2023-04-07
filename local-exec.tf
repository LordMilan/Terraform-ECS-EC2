## Executing shell script to build image and push to ECR via Null Resource ##
## API ##
resource "null_resource" "build_api" {
 provisioner "local-exec" {
    command = "sh qa-enrollible-msg-center-api.sh > qa-enrollible-msg-center-api.log 2>&1"
    interpreter = ["/bin/bash", "-c"]
    working_dir = "./build-files"
  }
}

## UI ##
resource "null_resource" "build_ui" {
 provisioner "local-exec" {
    command = "sh qa-enrollible-msg-center-ui.sh > qa-enrollible-msg-center-ui.log 2>&1"
    interpreter = ["/bin/bash", "-c"]
    working_dir = "./build-files"
  }
}