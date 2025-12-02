#!/bin/bash

# k8s 디렉토리의 모든 쿠버네티스 YAML 파일을 적용하는 스크립트입니다.
# 의존성이 충족되도록 특정 순서로 적용합니다.

# 명령어 실행 중 오류 발생 시 즉시 중단합니다.
set -e

# 쿠버네티스 설정 기본 디렉토리
K8S_DIR="k8s"

echo "Applying all configurations (ConfigMaps, Secrets, etc.)..."
kubectl apply -R -f "k8s/infra/config/"
kubectl apply -R -f "k8s/service/config/"

echo "Waiting 10 seconds before applying infra services..."
sleep 10

echo "Applying all deployments and services..."
kubectl apply -R -f "k8s/infra/outer/"
echo "Waiting 10 seconds before applying infra services..."
sleep 10
kubectl apply -R -f "k8s/service/outer/"

echo "All Kubernetes configurations have been applied successfully."
