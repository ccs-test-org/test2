cmd='checkov -f case1.tf --external-checks-dir . -c case1 --compact'
echo "### Executing: $cmd"
$cmd