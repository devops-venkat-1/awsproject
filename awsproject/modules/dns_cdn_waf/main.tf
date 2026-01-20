variable "domain_name" {}
variable "alb_name" {}
variable "cdn_name" {}
variable "waf_name" {}

# Minimal placeholder (can be expanded later)
resource "aws_wafv2_web_acl" "this" {
  name  = var.waf_name
  scope = "REGIONAL"
  default_action { allow {} }
  visibility_config {
    cloudwatch_metrics_enabled = false
    metric_name = "waf"
    sampled_requests_enabled = false
  }
}

