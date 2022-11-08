CASE=case$1
CMD="checkov -f $CASE.tf --external-checks-dir . -c $CASE --compact"
echo "### Executing: $CMD"
$CMD

# CLI usage
if [ $# -lt 2 ]
then
  echo 1>&2 "$0: not enough arguments\n"
  echo "Usage: ckv.sh <check_id>\n"
  exit 1
fi