## 0.50.0 (2025-01-10)

### Removed (1 change)

- [Remove outdated OpenTofu versions to reduce build matrix](https://gitlab.com/components/opentofu/-/commit/78e65a570566747f6397b8b19381821309b0cc74) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/221))

## 0.49.0 (2025-01-06)

No changes.

## 0.48.0 (2024-12-13)

### Added (1 change)

- [Introduce input to allow Developer role to plan](https://gitlab.com/components/opentofu/-/commit/89f7672cf6ac0735970820c7e5ba37271513b2c5) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/212))

### Changed (1 change)

- [Pass var file to init](https://gitlab.com/components/opentofu/-/commit/b7538d3d84d9cb2bfcf184032c15928b4d373f53) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/213))

## 0.48.0-rc1 (2024-12-12)

### Added (1 change)

- [Introduce input to allow Developer role to plan](https://gitlab.com/components/opentofu/-/commit/89f7672cf6ac0735970820c7e5ba37271513b2c5) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/212))

### Changed (1 change)

- [Pass var file to init](https://gitlab.com/components/opentofu/-/commit/b7538d3d84d9cb2bfcf184032c15928b4d373f53) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/213))

## 0.47.0 (2024-12-10)

### Added (1 change)

- [Add opencontainers image annotations](https://gitlab.com/components/opentofu/-/commit/ea36a659e53dc2f098f5b2c7059f3c7df5616996) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/209))

## 0.47.0-rc2 (2024-12-06)

### Added (1 change)

- [Add opencontainers image annotations](https://gitlab.com/components/opentofu/-/commit/ea36a659e53dc2f098f5b2c7059f3c7df5616996) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/209))

## 0.47.0-rc1 (2024-12-06)

### Added (1 change)

- [Add opencontainers image annotations](https://gitlab.com/components/opentofu/-/commit/ea36a659e53dc2f098f5b2c7059f3c7df5616996) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/209))

## 0.46.0 (2024-12-04)

### Added (1 change)

- [Support `auto_encryption` feature](https://gitlab.com/components/opentofu/-/commit/d4ec9fba6c64a01e2875af403126d9570ea539dc) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/198))

### Fixed (1 change)

- [Install wget in alpine image to add support for building behind a proxy](https://gitlab.com/components/opentofu/-/commit/c9fcc5a49093b56429844ff5ddd2e0f5afff5891) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/205))

## 0.45.0 (2024-11-26)

No changes.

## 0.44.0 (2024-11-14)

### Added (1 change)

- [Document state and plan encryption support](https://gitlab.com/components/opentofu/-/commit/ca2687c20ee0a1936d2781e26df3a9d0da27e128) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/197))

## 0.43.0 (2024-11-14)

### Fixed (1 change)

- [Fix JSON path file ending](https://gitlab.com/components/opentofu/-/commit/b685140108dd55cf608805ea52668774313c4cf9)

## 0.42.0 (2024-11-14)

### Added (2 changes)

- [Support running pipeline templates directly in child pipeline with...](https://gitlab.com/components/opentofu/-/commit/cc000b48848916dcee2564e22bc2dfdff8f49729) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/190))
- [Support env variable to force sourcing `gitlab-tofu`](https://gitlab.com/components/opentofu/-/commit/05a987a8a3d94a7286819fbe2e8f908029fe8f9a) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/184))

### Changed (15 changes)

- [Rename `terraform_authenticate_private_registry` function to `tofu_authenticate_private_registry`](https://gitlab.com/components/opentofu/-/commit/4ac18238c41b52d5aea3516f21defbc16ed1c779) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/189))
- [Rename `terraform_init` function to `tofu_init`](https://gitlab.com/components/opentofu/-/commit/30b74af078485fa7fad31f50898a6a98f63a4873) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/189))
- [Rename `TF_INIT_FLAGS` to `GITLAB_TOFU_INIT_FLAGS`](https://gitlab.com/components/opentofu/-/commit/b66c7ca01ac56f39efd0547c017b056531ec71ec) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/189))
- [Deprecate `TF_ROOT` and introduce `GITLAB_TOFU_ROOT_DIR` as replacement](https://gitlab.com/components/opentofu/-/commit/f3815f14b7c110653263f686fcec12a262547573) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/189))
- [Deprecate `TF_ADDRESS` and introduce `GITLAB_TOFU_STATE_ADDRESS` as replacement](https://gitlab.com/components/opentofu/-/commit/687fb9024fd295be376afae024ffa5f85b9abb6c) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/189))
- [Deprecate `TF_STATE_NAME` and introduce `GITLAB_TOFU_STATE_NAME` as replacement](https://gitlab.com/components/opentofu/-/commit/a6bc5c554914181a4d151fc9a8fd648d0dab74d5) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/189))
- [Rename `TF_INIT_NO_RECONFIGURE` to `GITLAB_TOFU_INIT_NO_RECONFIGURE`](https://gitlab.com/components/opentofu/-/commit/447fe033f61a3858ffdeb3087ccf8c05ab41118d) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/189))
- [Rename `DEBUG_OUTPUT` to `GITLAB_TOFU_DEBUG`](https://gitlab.com/components/opentofu/-/commit/6cf020389aca14d59889b5c13008d0c4427cc1ba) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/189))
- [Rename `TF_IGNORE_INIT_ERRORS` to `GITLAB_TOFU_IGNORE_INIT_ERRORS`](https://gitlab.com/components/opentofu/-/commit/bee398ded147e29901a2c5716bee09dbe827c7bc) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/189))
- [Rename `TF_IMPLICIT_INIT` to `GITLAB_TOFU_IMPLICIT_INIT`](https://gitlab.com/components/opentofu/-/commit/d731c2b925e54d9dd1059ef3ee7bc9529b547ce8) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/189))
- [Rename `TF_PLAN_JSON` to `GITLAB_TOFU_PLAN_JSON`](https://gitlab.com/components/opentofu/-/commit/3ce2b6436f4288220f2e98b5e6c5ed8d92209a2e) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/189))
- [Rename `TF_PLAN_CACHE` to `GITLAB_TOFU_PLAN_CACHE`](https://gitlab.com/components/opentofu/-/commit/fe5fea976bb0fe1ae472fab23e35869407c21557) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/189))
- [Rename `TF_PLAN_NAME` to `GITLAB_TOFU_PLAN_NAME`](https://gitlab.com/components/opentofu/-/commit/999bff8851d4e13a35b302895321beba0302e765) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/189))
- [Rename `TF_APPLY_NO_PLAN` to `GITLAB_TOFU_APPLY_NO_PLAN`](https://gitlab.com/components/opentofu/-/commit/1c4120f9b27d0bd53e77bf0bac6b42908d4dbf7f) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/189))
- [Rename `TF_GITLAB_SOURCED` variable to `GITLAB_TOFU_SOURCED`.](https://gitlab.com/components/opentofu/-/commit/d003be31b40f63b0779839de292f4a5e6cc20dff) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/188))

### Removed (3 changes)

- [Remove support for `TF_USERNAME` and `TF_PASSWORD` environment variables](https://gitlab.com/components/opentofu/-/commit/df9639ea3e7ee3483b12d5c9309b29019e035e16) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/189))
- [Remove `TF_FF_AUTO_URLENCODE_STATE_NAME` feature flag](https://gitlab.com/components/opentofu/-/commit/300f345e0b3952ac37305b130231832494dd0d1b) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/187))
- [Remove `TF_FF_AUTO_APPROVE_APPLY` feature flag](https://gitlab.com/components/opentofu/-/commit/bac5a61b3915aa91f3fddf577cf3dd266786f41a) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/186))

### Development (3 changes)

- [Refactor environment variable handling](https://gitlab.com/components/opentofu/-/commit/f60c4583ec9317be1555ca3bc185b8a245f5b5b7) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/189))
- [Rename internal `OPENTOFU_COMPONENT_` variables to `GITLAB_TOFU_`](https://gitlab.com/components/opentofu/-/commit/70a67d253df6ceed8fd19f067c98bf5da34abbce) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/185))
- [Support custom runner tag for image build job](https://gitlab.com/components/opentofu/-/commit/cfbc9d7950c7651f2cc0a551dfe52d623e19afb0) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/183))

## 0.42.0-rc4 (2024-11-14)

### Added (2 changes)

- [Support running pipeline templates directly in child pipeline with...](https://gitlab.com/components/opentofu/-/commit/cc000b48848916dcee2564e22bc2dfdff8f49729) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/190))
- [Support env variable to force sourcing `gitlab-tofu`](https://gitlab.com/components/opentofu/-/commit/05a987a8a3d94a7286819fbe2e8f908029fe8f9a) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/184))

### Changed (15 changes)

- [Rename `terraform_authenticate_private_registry` function to `tofu_authenticate_private_registry`](https://gitlab.com/components/opentofu/-/commit/4ac18238c41b52d5aea3516f21defbc16ed1c779) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/189))
- [Rename `terraform_init` function to `tofu_init`](https://gitlab.com/components/opentofu/-/commit/30b74af078485fa7fad31f50898a6a98f63a4873) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/189))
- [Rename `TF_INIT_FLAGS` to `GITLAB_TOFU_INIT_FLAGS`](https://gitlab.com/components/opentofu/-/commit/b66c7ca01ac56f39efd0547c017b056531ec71ec) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/189))
- [Deprecate `TF_ROOT` and introduce `GITLAB_TOFU_ROOT_DIR` as replacement](https://gitlab.com/components/opentofu/-/commit/f3815f14b7c110653263f686fcec12a262547573) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/189))
- [Deprecate `TF_ADDRESS` and introduce `GITLAB_TOFU_STATE_ADDRESS` as replacement](https://gitlab.com/components/opentofu/-/commit/687fb9024fd295be376afae024ffa5f85b9abb6c) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/189))
- [Deprecate `TF_STATE_NAME` and introduce `GITLAB_TOFU_STATE_NAME` as replacement](https://gitlab.com/components/opentofu/-/commit/a6bc5c554914181a4d151fc9a8fd648d0dab74d5) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/189))
- [Rename `TF_INIT_NO_RECONFIGURE` to `GITLAB_TOFU_INIT_NO_RECONFIGURE`](https://gitlab.com/components/opentofu/-/commit/447fe033f61a3858ffdeb3087ccf8c05ab41118d) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/189))
- [Rename `DEBUG_OUTPUT` to `GITLAB_TOFU_DEBUG`](https://gitlab.com/components/opentofu/-/commit/6cf020389aca14d59889b5c13008d0c4427cc1ba) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/189))
- [Rename `TF_IGNORE_INIT_ERRORS` to `GITLAB_TOFU_IGNORE_INIT_ERRORS`](https://gitlab.com/components/opentofu/-/commit/bee398ded147e29901a2c5716bee09dbe827c7bc) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/189))
- [Rename `TF_IMPLICIT_INIT` to `GITLAB_TOFU_IMPLICIT_INIT`](https://gitlab.com/components/opentofu/-/commit/d731c2b925e54d9dd1059ef3ee7bc9529b547ce8) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/189))
- [Rename `TF_PLAN_JSON` to `GITLAB_TOFU_PLAN_JSON`](https://gitlab.com/components/opentofu/-/commit/3ce2b6436f4288220f2e98b5e6c5ed8d92209a2e) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/189))
- [Rename `TF_PLAN_CACHE` to `GITLAB_TOFU_PLAN_CACHE`](https://gitlab.com/components/opentofu/-/commit/fe5fea976bb0fe1ae472fab23e35869407c21557) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/189))
- [Rename `TF_PLAN_NAME` to `GITLAB_TOFU_PLAN_NAME`](https://gitlab.com/components/opentofu/-/commit/999bff8851d4e13a35b302895321beba0302e765) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/189))
- [Rename `TF_APPLY_NO_PLAN` to `GITLAB_TOFU_APPLY_NO_PLAN`](https://gitlab.com/components/opentofu/-/commit/1c4120f9b27d0bd53e77bf0bac6b42908d4dbf7f) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/189))
- [Rename `TF_GITLAB_SOURCED` variable to `GITLAB_TOFU_SOURCED`.](https://gitlab.com/components/opentofu/-/commit/d003be31b40f63b0779839de292f4a5e6cc20dff) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/188))

### Removed (3 changes)

- [Remove support for `TF_USERNAME` and `TF_PASSWORD` environment variables](https://gitlab.com/components/opentofu/-/commit/df9639ea3e7ee3483b12d5c9309b29019e035e16) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/189))
- [Remove `TF_FF_AUTO_URLENCODE_STATE_NAME` feature flag](https://gitlab.com/components/opentofu/-/commit/300f345e0b3952ac37305b130231832494dd0d1b) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/187))
- [Remove `TF_FF_AUTO_APPROVE_APPLY` feature flag](https://gitlab.com/components/opentofu/-/commit/bac5a61b3915aa91f3fddf577cf3dd266786f41a) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/186))

### Development (3 changes)

- [Refactor environment variable handling](https://gitlab.com/components/opentofu/-/commit/f60c4583ec9317be1555ca3bc185b8a245f5b5b7) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/189))
- [Rename internal `OPENTOFU_COMPONENT_` variables to `GITLAB_TOFU_`](https://gitlab.com/components/opentofu/-/commit/70a67d253df6ceed8fd19f067c98bf5da34abbce) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/185))
- [Support custom runner tag for image build job](https://gitlab.com/components/opentofu/-/commit/cfbc9d7950c7651f2cc0a551dfe52d623e19afb0) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/183))

## 0.42.0-rc3 (2024-11-14)

### Added (2 changes)

- [Support running pipeline templates directly in child pipeline with...](https://gitlab.com/components/opentofu/-/commit/cc000b48848916dcee2564e22bc2dfdff8f49729) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/190))
- [Support env variable to force sourcing `gitlab-tofu`](https://gitlab.com/components/opentofu/-/commit/05a987a8a3d94a7286819fbe2e8f908029fe8f9a) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/184))

### Changed (1 change)

- [Rename `TF_GITLAB_SOURCED` variable to `GITLAB_TOFU_SOURCED`.](https://gitlab.com/components/opentofu/-/commit/d003be31b40f63b0779839de292f4a5e6cc20dff) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/188))

### Removed (2 changes)

- [Remove `TF_FF_AUTO_URLENCODE_STATE_NAME` feature flag](https://gitlab.com/components/opentofu/-/commit/300f345e0b3952ac37305b130231832494dd0d1b) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/187))
- [Remove `TF_FF_AUTO_APPROVE_APPLY` feature flag](https://gitlab.com/components/opentofu/-/commit/bac5a61b3915aa91f3fddf577cf3dd266786f41a) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/186))

### Development (2 changes)

- [Rename internal `OPENTOFU_COMPONENT_` variables to `GITLAB_TOFU_`](https://gitlab.com/components/opentofu/-/commit/70a67d253df6ceed8fd19f067c98bf5da34abbce) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/185))
- [Support custom runner tag for image build job](https://gitlab.com/components/opentofu/-/commit/cfbc9d7950c7651f2cc0a551dfe52d623e19afb0) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/183))

## 0.42.0-rc2 (2024-11-13)

### Added (1 change)

- [Support env variable to force sourcing `gitlab-tofu`](https://gitlab.com/components/opentofu/-/commit/05a987a8a3d94a7286819fbe2e8f908029fe8f9a) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/184))

### Removed (2 changes)

- [Remove `TF_FF_AUTO_URLENCODE_STATE_NAME` feature flag](https://gitlab.com/components/opentofu/-/commit/300f345e0b3952ac37305b130231832494dd0d1b) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/187))
- [Remove `TF_FF_AUTO_APPROVE_APPLY` feature flag](https://gitlab.com/components/opentofu/-/commit/bac5a61b3915aa91f3fddf577cf3dd266786f41a) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/186))

### Development (2 changes)

- [Rename internal `OPENTOFU_COMPONENT_` variables to `GITLAB_TOFU_`](https://gitlab.com/components/opentofu/-/commit/70a67d253df6ceed8fd19f067c98bf5da34abbce) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/185))
- [Support custom runner tag for image build job](https://gitlab.com/components/opentofu/-/commit/cfbc9d7950c7651f2cc0a551dfe52d623e19afb0) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/183))

## 0.42.0-rc1 (2024-11-12)

### Development (1 change)

- [Support custom runner tag for image build job](https://gitlab.com/components/opentofu/-/commit/cfbc9d7950c7651f2cc0a551dfe52d623e19afb0) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/183))

## 0.41.0 (2024-11-12)

### Added (1 change)

- [Support OpenTofu 1.9.0-alpha1](https://gitlab.com/components/opentofu/-/commit/7c0526c107066c8d4538c78d479521753dee5235) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/182))

## 0.40.0 (2024-11-12)

### Added (3 changes)

- [Support `warning_on_none_empty_plan` input in pipeline templates](https://gitlab.com/components/opentofu/-/commit/27a482a76e7ee35b94f8539a50ecdf325f8711cb) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/170))
- [Support `warning_on_none_empty_plan` input in `plan` job.](https://gitlab.com/components/opentofu/-/commit/4065954e5f9cefe02dc526951efb28afc7e8b661) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/170))
- [Pass `plan` input down from compound templates](https://gitlab.com/components/opentofu/-/commit/4005bfaa98b82c73fbadaff6428398f9a0af15d6) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/169))

### Fixed (3 changes)

- [Fix manual destroy jobs](https://gitlab.com/components/opentofu/-/commit/fbecaf367d5114c71e70708bb74a6ea7c705ad70) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/179))
- [Fix plan json generation if `warning_on_non_empty_plan` is `true` and plan is non-empty](https://gitlab.com/components/opentofu/-/commit/8f5b05bb1f05d965d5db71cb4044e441e1f55c94) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/178))
- [Remove duplicate image digest from `apply` job](https://gitlab.com/components/opentofu/-/commit/bb9aa26fb93919518c08210d5b6e0550b6ff76d5) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/176))

### Changed (2 changes)

- [Rename `warning_on_none_empty_plan` to `warning_on_non_empty_plan`](https://gitlab.com/components/opentofu/-/commit/9336f64b232694ea91135b478bb8813ef47343e6) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/173))
- [Change cache policy in `validate-plan*` templates to only push in `validate` job](https://gitlab.com/components/opentofu/-/commit/b16327a0bf10cd28e8a1bf7189aafab027cfa31c) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/172))

### Removed (3 changes)

- [Remove `auto_apply` and `auto_destroy` inputs](https://gitlab.com/components/opentofu/-/commit/cac07e055a2b039ce5943704c99bdb4798a63fb4) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/177))
- [Remove unused cache setup in `fmt` job](https://gitlab.com/components/opentofu/-/commit/40694b5d73c3f52144784e9d38a75c07ca6bf342) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/172))
- [Remove old OpenTofu versions](https://gitlab.com/components/opentofu/-/commit/0a106f377cf0cafaeaed7db71d9b2761a9ca33d2) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/171))

### Development (1 change)

- [This is a changelog test commit](https://gitlab.com/components/opentofu/-/commit/7cba70e7b82843b05bf4c5bfcb2e7260596e4d04)

## 0.40.0-rc7 (2024-11-11)

### Added (3 changes)

- [Support `warning_on_none_empty_plan` input in pipeline templates](https://gitlab.com/components/opentofu/-/commit/27a482a76e7ee35b94f8539a50ecdf325f8711cb) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/170))
- [Support `warning_on_none_empty_plan` input in `plan` job.](https://gitlab.com/components/opentofu/-/commit/4065954e5f9cefe02dc526951efb28afc7e8b661) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/170))
- [Pass `plan` input down from compound templates](https://gitlab.com/components/opentofu/-/commit/4005bfaa98b82c73fbadaff6428398f9a0af15d6) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/169))

### Fixed (3 changes)

- [Fix manual destroy jobs](https://gitlab.com/components/opentofu/-/commit/fbecaf367d5114c71e70708bb74a6ea7c705ad70) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/179))
- [Fix plan json generation if `warning_on_non_empty_plan` is `true` and plan is non-empty](https://gitlab.com/components/opentofu/-/commit/8f5b05bb1f05d965d5db71cb4044e441e1f55c94) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/178))
- [Remove duplicate image digest from `apply` job](https://gitlab.com/components/opentofu/-/commit/bb9aa26fb93919518c08210d5b6e0550b6ff76d5) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/176))

### Changed (2 changes)

- [Rename `warning_on_none_empty_plan` to `warning_on_non_empty_plan`](https://gitlab.com/components/opentofu/-/commit/9336f64b232694ea91135b478bb8813ef47343e6) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/173))
- [Change cache policy in `validate-plan*` templates to only push in `validate` job](https://gitlab.com/components/opentofu/-/commit/b16327a0bf10cd28e8a1bf7189aafab027cfa31c) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/172))

### Removed (3 changes)

- [Remove `auto_apply` and `auto_destroy` inputs](https://gitlab.com/components/opentofu/-/commit/cac07e055a2b039ce5943704c99bdb4798a63fb4) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/177))
- [Remove unused cache setup in `fmt` job](https://gitlab.com/components/opentofu/-/commit/40694b5d73c3f52144784e9d38a75c07ca6bf342) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/172))
- [Remove old OpenTofu versions](https://gitlab.com/components/opentofu/-/commit/0a106f377cf0cafaeaed7db71d9b2761a9ca33d2) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/171))

### Development (1 change)

- [This is a changelog test commit](https://gitlab.com/components/opentofu/-/commit/7cba70e7b82843b05bf4c5bfcb2e7260596e4d04)

## 0.40.0-rc6 (2024-11-11)

### Added (3 changes)

- [Support `warning_on_none_empty_plan` input in pipeline templates](https://gitlab.com/components/opentofu/-/commit/27a482a76e7ee35b94f8539a50ecdf325f8711cb) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/170))
- [Support `warning_on_none_empty_plan` input in `plan` job.](https://gitlab.com/components/opentofu/-/commit/4065954e5f9cefe02dc526951efb28afc7e8b661) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/170))
- [Pass `plan` input down from compound templates](https://gitlab.com/components/opentofu/-/commit/4005bfaa98b82c73fbadaff6428398f9a0af15d6) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/169))

### Fixed (2 changes)

- [Fix plan json generation if `warning_on_non_empty_plan` is `true` and plan is non-empty](https://gitlab.com/components/opentofu/-/commit/8f5b05bb1f05d965d5db71cb4044e441e1f55c94) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/178))
- [Remove duplicate image digest from `apply` job](https://gitlab.com/components/opentofu/-/commit/bb9aa26fb93919518c08210d5b6e0550b6ff76d5) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/176))

### Changed (2 changes)

- [Rename `warning_on_none_empty_plan` to `warning_on_non_empty_plan`](https://gitlab.com/components/opentofu/-/commit/9336f64b232694ea91135b478bb8813ef47343e6) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/173))
- [Change cache policy in `validate-plan*` templates to only push in `validate` job](https://gitlab.com/components/opentofu/-/commit/b16327a0bf10cd28e8a1bf7189aafab027cfa31c) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/172))

### Removed (3 changes)

- [Remove `auto_apply` and `auto_destroy` inputs](https://gitlab.com/components/opentofu/-/commit/cac07e055a2b039ce5943704c99bdb4798a63fb4) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/177))
- [Remove unused cache setup in `fmt` job](https://gitlab.com/components/opentofu/-/commit/40694b5d73c3f52144784e9d38a75c07ca6bf342) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/172))
- [Remove old OpenTofu versions](https://gitlab.com/components/opentofu/-/commit/0a106f377cf0cafaeaed7db71d9b2761a9ca33d2) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/171))

### Development (1 change)

- [This is a changelog test commit](https://gitlab.com/components/opentofu/-/commit/7cba70e7b82843b05bf4c5bfcb2e7260596e4d04)

## 0.40.0-rc5 (2024-11-06)

### Added (3 changes)

- [Support `warning_on_none_empty_plan` input in pipeline templates](https://gitlab.com/components/opentofu/-/commit/27a482a76e7ee35b94f8539a50ecdf325f8711cb) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/170))
- [Support `warning_on_none_empty_plan` input in `plan` job.](https://gitlab.com/components/opentofu/-/commit/4065954e5f9cefe02dc526951efb28afc7e8b661) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/170))
- [Pass `plan` input down from compound templates](https://gitlab.com/components/opentofu/-/commit/4005bfaa98b82c73fbadaff6428398f9a0af15d6) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/169))

### Changed (1 change)

- [Change cache policy in `validate-plan*` templates to only push in `validate` job](https://gitlab.com/components/opentofu/-/commit/b16327a0bf10cd28e8a1bf7189aafab027cfa31c) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/172))

### Removed (2 changes)

- [Remove unused cache setup in `fmt` job](https://gitlab.com/components/opentofu/-/commit/40694b5d73c3f52144784e9d38a75c07ca6bf342) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/172))
- [Remove old OpenTofu versions](https://gitlab.com/components/opentofu/-/commit/0a106f377cf0cafaeaed7db71d9b2761a9ca33d2) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/171))

### Development (1 change)

- [This is a changelog test commit](https://gitlab.com/components/opentofu/-/commit/7cba70e7b82843b05bf4c5bfcb2e7260596e4d04)

## 0.40.0-rc4 (2024-11-05)

### Added (3 changes)

- [Support `warning_on_none_empty_plan` input in pipeline templates](https://gitlab.com/components/opentofu/-/commit/27a482a76e7ee35b94f8539a50ecdf325f8711cb) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/170))
- [Support `warning_on_none_empty_plan` input in `plan` job.](https://gitlab.com/components/opentofu/-/commit/4065954e5f9cefe02dc526951efb28afc7e8b661) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/170))
- [Pass `plan` input down from compound templates](https://gitlab.com/components/opentofu/-/commit/4005bfaa98b82c73fbadaff6428398f9a0af15d6) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/169))

### Removed (1 change)

- [Remove old OpenTofu versions](https://gitlab.com/components/opentofu/-/commit/0a106f377cf0cafaeaed7db71d9b2761a9ca33d2) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/171))

### Development (1 change)

- [This is a changelog test commit](https://gitlab.com/components/opentofu/-/commit/7cba70e7b82843b05bf4c5bfcb2e7260596e4d04)

## 0.40.0-rc3 (2024-11-05)

### Added (1 change)

- [Pass `plan` input down from compound templates](https://gitlab.com/components/opentofu/-/commit/4005bfaa98b82c73fbadaff6428398f9a0af15d6) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/169))

### Development (1 change)

- [This is a changelog test commit](https://gitlab.com/components/opentofu/-/commit/7cba70e7b82843b05bf4c5bfcb2e7260596e4d04)

## 0.40.0-rc2 (2024-11-05)

### Added (1 change)

- [Pass `plan` input down from compound templates](https://gitlab.com/components/opentofu/-/commit/4005bfaa98b82c73fbadaff6428398f9a0af15d6) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/169))

### Development (1 change)

- [This is a changelog test commit](https://gitlab.com/components/opentofu/-/commit/7cba70e7b82843b05bf4c5bfcb2e7260596e4d04)

## 0.40.0-rc1 (2024-11-04)

No changes.

## 0.39.0 (2024-11-04)

### Added (13 changes)

- [Support `<job>_rules` inputs in `validate-plan-destroy` pipeline template](https://gitlab.com/components/opentofu/-/commit/a0c469184d4d5b4a28c3629150721f5d21a4f1db) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/164))
- [Support `<job>_rules` inputs in `full-pipeline` pipeline template](https://gitlab.com/components/opentofu/-/commit/44cb7c5e0f010bca155971306deffdcd382e3210) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/164))
- [Support `<job>_rules` inputs in `validate-plan-apply` pipeline template](https://gitlab.com/components/opentofu/-/commit/a65164af6bed66d317a89419a715fd89ad4a072a) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/164))
- [Support `<job>_rules` inputs in `validate-plan` pipeline template](https://gitlab.com/components/opentofu/-/commit/a6f33ab3c1e2a2ecce3c73b004b9124a179a5423) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/164))
- [Support `needs` input in `custom-command` job](https://gitlab.com/components/opentofu/-/commit/ee25f6fce69f98b62e6d2cbe97399c8f9072229e) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/164))
- [Support `needs` input in `graph` job](https://gitlab.com/components/opentofu/-/commit/84679f51c97328fa8b1d8a20315dfb347ec322cf) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/164))
- [Support `rules` input in `delete-state` job](https://gitlab.com/components/opentofu/-/commit/e7b03dd0d5bfc6448615b16c9b2710b25f90e40f) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/164))
- [Support `rules` input in `destroy` job](https://gitlab.com/components/opentofu/-/commit/813e69e3168e2e44aacca01152baa7d13e07440a) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/164))
- [Support `rules` input in `apply` job](https://gitlab.com/components/opentofu/-/commit/67a9f22976310cc8c356e6934e1a47e0eb114880) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/164))
- [Support `needs` and `jobs` inputs in `test` job](https://gitlab.com/components/opentofu/-/commit/119b9f19b87553e03ccb1f24af5753e4fa9e3411) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/164))
- [Support `rules` in `plan` job](https://gitlab.com/components/opentofu/-/commit/b317c0be55e74998e32ba2d75a445bca3591d302) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/164))
- [Support `rules` in `validate` job](https://gitlab.com/components/opentofu/-/commit/7f649dadc3fecb46d3281df3fcbb7245b2504496) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/164))
- [Support `needs` and `rules` inputs in `fmt` job](https://gitlab.com/components/opentofu/-/commit/38cefbe9bc40129ba1f039c691307ca6908a94a9) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/164))

### Development (2 changes)

- [Make changelog API call in release script verbose](https://gitlab.com/components/opentofu/-/commit/883da23886cdb2b659f34a50747977c0d9d6f065)
- [Use buildah cache](https://gitlab.com/components/opentofu/-/commit/5da430c6edd94da8c53347e9077c4c633270b6a7) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/165))

## 0.39.0-rc2 (2024-11-04)

### Added (13 changes)

- [Support `<job>_rules` inputs in `validate-plan-destroy` pipeline template](https://gitlab.com/components/opentofu/-/commit/a0c469184d4d5b4a28c3629150721f5d21a4f1db) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/164))
- [Support `<job>_rules` inputs in `full-pipeline` pipeline template](https://gitlab.com/components/opentofu/-/commit/44cb7c5e0f010bca155971306deffdcd382e3210) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/164))
- [Support `<job>_rules` inputs in `validate-plan-apply` pipeline template](https://gitlab.com/components/opentofu/-/commit/a65164af6bed66d317a89419a715fd89ad4a072a) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/164))
- [Support `<job>_rules` inputs in `validate-plan` pipeline template](https://gitlab.com/components/opentofu/-/commit/a6f33ab3c1e2a2ecce3c73b004b9124a179a5423) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/164))
- [Support `needs` input in `custom-command` job](https://gitlab.com/components/opentofu/-/commit/ee25f6fce69f98b62e6d2cbe97399c8f9072229e) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/164))
- [Support `needs` input in `graph` job](https://gitlab.com/components/opentofu/-/commit/84679f51c97328fa8b1d8a20315dfb347ec322cf) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/164))
- [Support `rules` input in `delete-state` job](https://gitlab.com/components/opentofu/-/commit/e7b03dd0d5bfc6448615b16c9b2710b25f90e40f) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/164))
- [Support `rules` input in `destroy` job](https://gitlab.com/components/opentofu/-/commit/813e69e3168e2e44aacca01152baa7d13e07440a) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/164))
- [Support `rules` input in `apply` job](https://gitlab.com/components/opentofu/-/commit/67a9f22976310cc8c356e6934e1a47e0eb114880) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/164))
- [Support `needs` and `jobs` inputs in `test` job](https://gitlab.com/components/opentofu/-/commit/119b9f19b87553e03ccb1f24af5753e4fa9e3411) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/164))
- [Support `rules` in `plan` job](https://gitlab.com/components/opentofu/-/commit/b317c0be55e74998e32ba2d75a445bca3591d302) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/164))
- [Support `rules` in `validate` job](https://gitlab.com/components/opentofu/-/commit/7f649dadc3fecb46d3281df3fcbb7245b2504496) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/164))
- [Support `needs` and `rules` inputs in `fmt` job](https://gitlab.com/components/opentofu/-/commit/38cefbe9bc40129ba1f039c691307ca6908a94a9) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/164))

### Development (2 changes)

- [Make changelog API call in release script verbose](https://gitlab.com/components/opentofu/-/commit/883da23886cdb2b659f34a50747977c0d9d6f065)
- [Use buildah cache](https://gitlab.com/components/opentofu/-/commit/5da430c6edd94da8c53347e9077c4c633270b6a7) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/165))

## 0.39.0-rc1 (2024-11-04)

### Added (13 changes)

- [Support `<job>_rules` inputs in `validate-plan-destroy` pipeline template](https://gitlab.com/components/opentofu/-/commit/a0c469184d4d5b4a28c3629150721f5d21a4f1db) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/164))
- [Support `<job>_rules` inputs in `full-pipeline` pipeline template](https://gitlab.com/components/opentofu/-/commit/44cb7c5e0f010bca155971306deffdcd382e3210) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/164))
- [Support `<job>_rules` inputs in `validate-plan-apply` pipeline template](https://gitlab.com/components/opentofu/-/commit/a65164af6bed66d317a89419a715fd89ad4a072a) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/164))
- [Support `<job>_rules` inputs in `validate-plan` pipeline template](https://gitlab.com/components/opentofu/-/commit/a6f33ab3c1e2a2ecce3c73b004b9124a179a5423) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/164))
- [Support `needs` input in `custom-command` job](https://gitlab.com/components/opentofu/-/commit/ee25f6fce69f98b62e6d2cbe97399c8f9072229e) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/164))
- [Support `needs` input in `graph` job](https://gitlab.com/components/opentofu/-/commit/84679f51c97328fa8b1d8a20315dfb347ec322cf) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/164))
- [Support `rules` input in `delete-state` job](https://gitlab.com/components/opentofu/-/commit/e7b03dd0d5bfc6448615b16c9b2710b25f90e40f) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/164))
- [Support `rules` input in `destroy` job](https://gitlab.com/components/opentofu/-/commit/813e69e3168e2e44aacca01152baa7d13e07440a) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/164))
- [Support `rules` input in `apply` job](https://gitlab.com/components/opentofu/-/commit/67a9f22976310cc8c356e6934e1a47e0eb114880) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/164))
- [Support `needs` and `jobs` inputs in `test` job](https://gitlab.com/components/opentofu/-/commit/119b9f19b87553e03ccb1f24af5753e4fa9e3411) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/164))
- [Support `rules` in `plan` job](https://gitlab.com/components/opentofu/-/commit/b317c0be55e74998e32ba2d75a445bca3591d302) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/164))
- [Support `rules` in `validate` job](https://gitlab.com/components/opentofu/-/commit/7f649dadc3fecb46d3281df3fcbb7245b2504496) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/164))
- [Support `needs` and `rules` inputs in `fmt` job](https://gitlab.com/components/opentofu/-/commit/38cefbe9bc40129ba1f039c691307ca6908a94a9) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/164))

## 0.38.0 (2024-11-02)

### Fixed (2 changes)

- [Fix job dependency in full-pipeline when using job prefix](https://gitlab.com/components/opentofu/-/commit/ddf4404f2b0c6df799c40c15eabb08aeca623e90)
- [Fix component version regex in renovate config](https://gitlab.com/components/opentofu/-/commit/879b197004e5d22f57e7f9cc590ba8165f7f2d96)

## 0.37.0-rc7 (2024-10-31)

### Added (4 changes)

- [Support var_file input in all templates](https://gitlab.com/components/opentofu/-/commit/e5efc717c1343000432f0b076933243dc8726770) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/160))
- [Document renovate usage for version input](https://gitlab.com/components/opentofu/-/commit/4827eb3c8f0a738bed6095f71a080ff4a6888f6b)
- [Support renovate custom manager for component version annotation](https://gitlab.com/components/opentofu/-/commit/106ada49cf28a34dcda1e6456003fc05b4ad9ac2)
- [Support unquoted opentofu_version input variables in renovate config](https://gitlab.com/components/opentofu/-/commit/47764fbd6179fb986f4bc0132bacba2208b24757)

### Fixed (1 change)

- [Fix renovate custom manager currentValue delimiters](https://gitlab.com/components/opentofu/-/commit/aadc8ab2c77a0effabfe4143847f52cc2af82a19)

### Development (4 changes)

- [Fix last stable version finding in release script](https://gitlab.com/components/opentofu/-/commit/f5e24ee1c793a9393e5a31b7afb5f8c42f49ddd5)
- [Use sh in README generation script instead of bash](https://gitlab.com/components/opentofu/-/commit/50b559706ced918875ecd186f440f64ddd8835d1)
- [Rename release notes generation script](https://gitlab.com/components/opentofu/-/commit/744a6c388e3cdbe1a97c5038d0131b34852feffc)
- [Outsource README generation script from Makefile into script](https://gitlab.com/components/opentofu/-/commit/b6c567adb188ec34f4a77f234bebbe52493bf3a4)

## 0.37.0-rc6 (2024-10-31)

### Development (4 changes)

- [Fix last stable version finding in release script](https://gitlab.com/components/opentofu/-/commit/f5e24ee1c793a9393e5a31b7afb5f8c42f49ddd5)
- [Use sh in README generation script instead of bash](https://gitlab.com/components/opentofu/-/commit/50b559706ced918875ecd186f440f64ddd8835d1)
- [Rename release notes generation script](https://gitlab.com/components/opentofu/-/commit/744a6c388e3cdbe1a97c5038d0131b34852feffc)
- [Outsource README generation script from Makefile into script](https://gitlab.com/components/opentofu/-/commit/b6c567adb188ec34f4a77f234bebbe52493bf3a4)

## 0.37.0-rc5 (2024-10-31)

No changes.

## 0.37.0-rc4 (2024-10-31)

No changes.

## 0.37.0-rc3 (2024-10-31)

No changes.

## 0.37.0-rc2 (2024-10-31)

No changes.

## 0.37.0-rc1 (2024-10-31)

No changes.

## 0.36.0 (2024-10-31)

No changes.

## 0.35.0-rc6 (2024-10-30)

### Fixed (1 change)

- [Only sign images on GitLab.com](https://gitlab.com/components/opentofu/-/commit/bafd24de55b17039204e9dbf1a6c9cdbb718a009) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/155))

### feature (2 changes)

- [Add support for job name prefix in full-pipeline](https://gitlab.com/components/opentofu/-/commit/72675b768dc3ddf81b0d665e0b5eadbebe10388e) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/153))
- [Support specifying image digests](https://gitlab.com/components/opentofu/-/commit/e6460418e6f1846f16474f6cadab2b935be556e7) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/152))

## 0.35.0-rc5 (2024-10-30)

### Fixed (1 change)

- [Only sign images on GitLab.com](https://gitlab.com/components/opentofu/-/commit/bafd24de55b17039204e9dbf1a6c9cdbb718a009) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/155))

### feature (2 changes)

- [Add support for job name prefix in full-pipeline](https://gitlab.com/components/opentofu/-/commit/72675b768dc3ddf81b0d665e0b5eadbebe10388e) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/153))
- [Support specifying image digests](https://gitlab.com/components/opentofu/-/commit/e6460418e6f1846f16474f6cadab2b935be556e7) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/152))

## 0.35.0-rc4 (2024-10-30)

### Fixed (1 change)

- [Only sign images on GitLab.com](https://gitlab.com/components/opentofu/-/commit/bafd24de55b17039204e9dbf1a6c9cdbb718a009) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/155))

### feature (2 changes)

- [Add support for job name prefix in full-pipeline](https://gitlab.com/components/opentofu/-/commit/72675b768dc3ddf81b0d665e0b5eadbebe10388e) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/153))
- [Support specifying image digests](https://gitlab.com/components/opentofu/-/commit/e6460418e6f1846f16474f6cadab2b935be556e7) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/152))

## 0.35.0-rc3 (2024-10-30)

### Fixed (1 change)

- [Only sign images on GitLab.com](https://gitlab.com/components/opentofu/-/commit/bafd24de55b17039204e9dbf1a6c9cdbb718a009) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/155))

### feature (2 changes)

- [Add support for job name prefix in full-pipeline](https://gitlab.com/components/opentofu/-/commit/72675b768dc3ddf81b0d665e0b5eadbebe10388e) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/153))
- [Support specifying image digests](https://gitlab.com/components/opentofu/-/commit/e6460418e6f1846f16474f6cadab2b935be556e7) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/152))

## 0.35.0-rc2 (2024-10-30)

### Fixed (1 change)

- [Only sign images on GitLab.com](https://gitlab.com/components/opentofu/-/commit/bafd24de55b17039204e9dbf1a6c9cdbb718a009) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/155))

### feature (2 changes)

- [Add support for job name prefix in full-pipeline](https://gitlab.com/components/opentofu/-/commit/72675b768dc3ddf81b0d665e0b5eadbebe10388e) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/153))
- [Support specifying image digests](https://gitlab.com/components/opentofu/-/commit/e6460418e6f1846f16474f6cadab2b935be556e7) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/152))

## 0.35.0-rc1 (2024-10-30)

### Fixed (1 change)

- [Only sign images on GitLab.com](https://gitlab.com/components/opentofu/-/commit/bafd24de55b17039204e9dbf1a6c9cdbb718a009) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/155))

### feature (2 changes)

- [Add support for job name prefix in full-pipeline](https://gitlab.com/components/opentofu/-/commit/72675b768dc3ddf81b0d665e0b5eadbebe10388e) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/153))
- [Support specifying image digests](https://gitlab.com/components/opentofu/-/commit/e6460418e6f1846f16474f6cadab2b935be556e7) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/152))

## 0.34.0-rc1 (2024-10-29)

No changes.

## 0.33.0 (2024-10-28)

### feature (2 changes)

- [Support GitLab dependency proxy when building gitlab-tofu images](https://gitlab.com/components/opentofu/-/commit/6bd8a73fa6c0445ec2cd44ad5bbd715afdd619a0) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/147))
- [Check for dependencies when running gitlab-tofu](https://gitlab.com/components/opentofu/-/commit/67acb93ba910d879884144e4dc27d2ff2b432dea) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/146))

## 0.32.0 (2024-10-28)

No changes.

## 0.31.0 (2024-10-24)

### Changed (1 change)

- [Improve documentation around module release](https://gitlab.com/components/opentofu/-/commit/1deda55c7f4a12b69b439af0f6d2eec4e9b97783) ([merge request](https://gitlab.com/components/opentofu/-/merge_requests/139))

## 0.30.0 (2024-10-07)

No changes.

## 0.29.0 (2024-09-20)

No changes.

## 0.28.0 (2024-09-19)

No changes.

## 0.27.0 (2024-09-05)

No changes.

## 0.26.0 (2024-08-20)

No changes.

## 0.25.0 (2024-07-30)

No changes.

## 0.24.0-rc1 (2024-07-08)

No changes.

## 0.23.0 (2024-07-05)

No changes.

## 0.22.0-rc4 (2024-07-05)

No changes.

## 0.22.0-rc3 (2024-06-19)

No changes.

## 0.22.0-rc2 (2024-06-03)

No changes.

## 0.22.0-rc1 (2024-05-31)

No changes.

## 0.21.0 (2024-05-31)

### Other (1 change)

- [Migrate unit tests from jobs to bats](components/opentofu@eed2fd8e270fbde4e21dcdeee9c0aea0545a437c) ([merge request](components/opentofu!76))

## 0.20.0 (2024-05-27)

### Added (1 change)

- [Auto URL-encode state name](components/opentofu@43148c5485b5b83cc858abb39f2033f579d2030c) ([merge request](components/opentofu!75))

## 0.19.0-rc1 (2024-05-15)

### Added (1 change)

- [Document best practice for lockfile handling](components/opentofu@e317401e6b3d8cb1b3b7f8f341eb6d3ab046961a) ([merge request](components/opentofu!64))

### Fixed (1 change)

- [Mock CI_SERVER_HOST predefined env variable for unit test](components/opentofu@1e5b1e3c269d4a38c986bdfec8dbd69456de79c2) ([merge request](components/opentofu!65))

## 0.18.0-rc5 (2024-04-08)

No changes.

## 0.18.0-rc4 (2024-04-08)

No changes.

## 0.18.0-rc3 (2024-04-08)

No changes.

## 0.18.0-rc2 (2024-04-08)

No changes.
