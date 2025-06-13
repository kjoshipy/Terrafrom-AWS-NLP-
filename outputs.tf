output "vpc_id" { value = aws_vpc.main.id }
output "subnet_id" { value = aws_subnet.main.id}
output "lambda_function_name" { value = aws_lambda_function.main.function_name }