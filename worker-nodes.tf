# add spot fleet Autoscaling policy
resource "aws_autoscaling_policy" "eks_autoscaling_policy" {
    count = length(local.worker_groups_launch_template)

    name                   = "${module.eks-cluster.workers_asg_names[count.index]}-autoscaling-policy"
    autoscaling_group_name = module.eks-cluster.workers_asg_names[count.index]
    policy_type            = "TargetTrackingScaling"

    target_tracking_configuration {
        predefined_metric_specification {
            predefined_metric_type = "ASGAverageCPUUtilization"
        }
        target_value = var.autoscaling_average_cpu
    }
}