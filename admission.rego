package kubernetes.admission

import rego.v1

deny contains msg if {
	input.kind == "SubjectAccessReview"
	input.spec.resourceAttributes.subresource == "proxy"
	msg := sprintf("you should not access proxy resource of node %q", [input.spec.resourceAttributes.name])
}
