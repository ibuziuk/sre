#!/bin/bash
#
# --------------------------------------------
# Get the number of namespaces on the cluster
# --------------------------------------------

getNumberOfNamespaces() {
    NUMBER_OF_NAMESPACES=$(oc get namespace | wc -l)
    export NUMBER_OF_NAMESPACES
}

getNumberOfNamespaces
echo "$NUMBER_OF_NAMESPACES"
