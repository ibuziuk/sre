#!/bin/bash
#
# Removing a user from a project.
# To get a list of the users who have access to a project, and in what role, a project manager can run the `oc get rolebindings` command.
# You must be in the project when you run this command.
#
# See https://cookbook.openshift.org/projects-and-user-collaboration/how-do-i-allow-another-user-to-work-on-my-project.html
#

DEFAULT_USER="user"
export USER=${USER:-${DEFAULT_USER}}

oc adm policy remove-role-from-user view "${USER}"
