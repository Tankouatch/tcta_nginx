resource "aws_acm_certificate" "example_certificate" {
  domain_name       = "interview.exosite.biz"  
  subject_alternative_names = ["*.interview.exosite.biz"]
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}
