# Contributing

Please read about CI/CD components and best practices at: https://docs.gitlab.com/ee/ci/components

## README

The [`README.md`](README.md) file is generated using `make docs` (see [`Makefile`](Makefile))
from [`.gitlab/README.md.template`](.gitlab/README.md.template).

## Upgrade OpenTofu versions

The file `opentofu_versions.yaml` in the root of the project acts as
Single Source of Truth (SSoT) for the OpenTofu versions currently supported.
The versions in the templates are rendered by the
`./.gitlab/scripts/update-opentofu-versions.sh` script and the versions in
the `.gitlab-ci.yml` file are referencing the data from the SSoT file by
using a combination of CI includes and `!reference`.

To update the supported OpenTofu versions perform the following steps:

- Update the SSoT file with the new latest version and supported versions.
- Run the `./.gitlab/scripts/update-opentofu-versions.sh` script.
- Commit the changes.
- Submit Merge Request.

## Releasing

Use the `make release` command with the `VERSION` argument set to the
version of the new release, like: `make release VERSION=1.0.0`.
The version must adhere to the [Semantic Versioning](https://semver.org) format.
