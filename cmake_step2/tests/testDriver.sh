#!/bin/bash
set -e

if [ $# -ne 2 ]; then
    echo "Usage: $0 <exe> <alg name>"
    exit 1
fi

errbnd=1e-7

alg="$2"
$1 alg=$alg runame=check_$alg outi=0 maxt=-5e-8 ic="rand(0,0.2,2)"

# relative error check
#err=$(awk 'function abs(x){return ((x < 0.0) ? -x : x)}; BEGIN {err=1e10;} ! /#/ {err1=abs(2*($2-$1)/($2+$1)); if(err1 < err) err = err1;} END {print err;}' \
#      check_$alg/check_${alg}_soln_final.curve)

# absolute error check
err=$(awk 'function abs(x){return ((x < 0.0) ? -x : x)}; BEGIN {err=1e10;} ! /#/ {err1=abs($2-$1); if(err1 < err) err = err1;} END {print err;}' \
      check_$alg/check_${alg}_soln_final.curve)

echo "Error = $err"
rm -fr check_$alg
awk "BEGIN {exit($err >= $errbnd);}"
