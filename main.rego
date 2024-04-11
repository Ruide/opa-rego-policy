package system

import rego.v1

import data.kubernetes.admission

main := {
	"apiVersion": "authorization.k8s.io/v1beta1",
	"kind": "SubjectAccessReview",
	"status": status,
}

status := {
	"allowed": false,
	"reason": reason,
} if {
	reason = concat(", ", admission.deny)
	reason != ""
}

else := {"allowed": true}
