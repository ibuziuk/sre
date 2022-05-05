#!/bin/bash
#
# --------------------------------------------
# Adds default users to the CRC cluster
# Docs - https://github.com/code-ready/crc/wiki/Add-another-user-to-cluster
# --------------------------------------------

if [[ -z "${CRC_KUBEADMIN_PASSWORD}" ]]; then
   echo "CRC 'kubeadmin' password is not set"
   exit 1
fi

export HTPASSWD_FILE=/tmp/htpasswd

htpasswd -c -B -b $HTPASSWD_FILE user1 password1
htpasswd -b $HTPASSWD_FILE user2 password2
htpasswd -b $HTPASSWD_FILE user3 password3
htpasswd -b $HTPASSWD_FILE user4 password4
htpasswd -b $HTPASSWD_FILE user5 password5
htpasswd -b $HTPASSWD_FILE user5 password5

# Make sure existing developer and kubeadmin user part of `htpasswd` file because kubeadmin is having cluster admin role.
htpasswd -b $HTPASSWD_FILE developer developer
htpasswd -b $HTPASSWD_FILE kubeadmin $CRC_KUBEADMIN_PASSWORD

oc get secrets htpass-secret -n openshift-config -ojsonpath='{.data.htpasswd}' | base64 -d >> htpasswd 
oc create secret generic htpass-secret --from-file=$HTPASSWD_FILE -n openshift-config --dry-run -o yaml > /tmp/htpass-secret.yaml
oc replace -f /tmp/htpass-secret.yaml
oc get pods -n openshift-authentication
