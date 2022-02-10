#!/bin/bash
#
# To add another user with 'view' role to the project, 
# so they can create and delete applications, you need to use the oc adm policy command. 
# You must be in the project when you run this command.
#
# See https://cookbook.openshift.org/projects-and-user-collaboration/how-do-i-allow-another-user-to-work-on-my-project.html
#

DEFAULT_USER="user"
export USER=${USER:-${DEFAULT_USER}}

oc adm policy add-role-to-user view "${USER}"
