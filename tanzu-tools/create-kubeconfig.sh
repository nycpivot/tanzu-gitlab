#!/usr/bin/env bash
set -eu

export KUBECONFIG=~/.kube/config
export CLUSTER_CA=${TBS_CLUSTER_CERTIFICATE_AUTHORITY}
export CLUSTER_ADDR=${TBS_CLUSTER_ADDRESS}
export CLUSTER_USER_CERT=${TBS_CLUSTER_USER_CERT}
export CLUSTER_USER_KEY=${TBS_CLUSTER_USER_KEY}

mkdir -p "$(dirname "${KUBECONFIG}")"

cat > "${KUBECONFIG}" << EOF
apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: ${CLUSTER_CA}
    server: ${CLUSTER_ADDR}
  name: cluster
contexts:
- context:
    cluster: cluster
    user: user
  name: user@cluster
current-context: user@cluster
kind: Config
users:
- name: user
  user:
    client-certificate-data: ${CLUSTER_USER_CERT}
    client-key-data: ${CLUSTER_USER_KEY}
EOF
