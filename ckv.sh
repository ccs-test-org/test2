CASE=case$1
CMD="checkov -f $CASE.tf --external-checks-dir . -c $CASE --compact"
echo "### Executing: $CMD"
$CMD