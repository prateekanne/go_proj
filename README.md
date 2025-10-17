# Go Project

A Go web application with automated CI/CD pipeline, security verification, and SLSA (Supply-chain Levels for Software Artifacts) compliance.

## Overview

This project is a simple Go web server that serves HTML content and provides a time endpoint. It demonstrates modern DevOps practices including automated testing, security verification, and supply chain security through SLSA attestations.

### 
Uses below two tools for verification report generation and validation using OPA with custom plugin:

- https://github.com/ptk1729/verifier_service
- https://github.com/ptk1729/opa_plugin