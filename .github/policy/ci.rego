package osv_scan

default allow = false

allow if {
    count(input.results) == 0
}

deny if {
    count(input.results) > 0
}

violation[msg] if {
    # TODO: Needs finer grained checks to determine if the vulnerability is critical or high
    # TODO: Needs to count the number of critical and high vulnerabilities
    # TODO: Needs to check if the vulnerability is in the allowlist
    count(input.results) > 0
    msg := sprintf("Vulnerabilities detected: %d result(s) found", [count(input.results)])
}


# deny access if any vulnerabilities are found in the scan results.

# default allow = false: by default, deny.

# allow: set to true only if there are zero vulnerabilities (input.results is empty).

# deny: triggered when there's at least one vulnerability.

# violation[msg]: emits a message like "Vulnerabilities detected: 3 result(s) found" if any are present. It's meant to be improved later with checks for severity or an allowlist.

# GOAL: if vulnerabilities exist, it blocks and logs how many. If no issues, access is allowed.
