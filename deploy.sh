#!/usr/bin/env bash
TAG=${1}
NS=${2}
URL=${3}
export BUILD_NUMBER=${TAG}
export NAMESPACE=${NS}
export ENV_URL=${URL}
for f in templates/*.yml
do
 envsubst < $f > “.generated/$(basename $f)”
done
kubectl apply -f .generated/
