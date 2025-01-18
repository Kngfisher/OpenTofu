#!/usr/bin/env bats

bats_require_minimum_version 1.5.0

# NOTE: BATS_LIBS must be set to the directory where bats-assert is installed.
load "$BATS_LIBS/bats-support/load"
load "$BATS_LIBS/bats-assert/load"

setup() {
  export GITLAB_TOFU_DEBUG=true

  # Change cwd to test specific directory
  cd "$BATS_TEST_TMPDIR"

  # Move TF test project directory to a temporary location
  cp -r "$TEST_PROJECT_DIR" "$BATS_TEST_TMPDIR"

  # Set TF root directory to temporary location
  export GITLAB_TOFU_ROOT_DIR="$BATS_TEST_TMPDIR/$(basename "$TEST_PROJECT_DIR")"

  # Set state so that each test has its own
  export GITLAB_TOFU_STATE_NAME="ci-unit-$CI_JOB_ID-$BATS_SUITE_TEST_NUMBER"
}

teardown() {
  curl --request DELETE -u "gitlab-ci-token:$CI_JOB_TOKEN" "$CI_API_V4_URL/projects/$CI_PROJECT_ID/terraform/state/$GITLAB_TOFU_STATE_NAME"
}

@test "gitlab-tofu init" {
  gitlab-tofu init
}

@test "gitlab-tofu init with args" {
  gitlab-tofu init -get=true -no-color
}

@test "gitlab-tofu init with environment variable flags" {
  export GITLAB_TOFU_INIT_FLAGS="-get=true -no-color"
  gitlab-tofu init
}

@test "gitlab-tofu init with args and environment variable flags" {
  export GITLAB_TOFU_INIT_FLAGS="-get=true"
  gitlab-tofu init -no-color
}

@test "gitlab-tofu init within GITLAB_TOFU_ROOT_DIR set" {
  cd "$GITLAB_TOFU_ROOT_DIR"
  unset "$GITLAB_TOFU_ROOT_DIR"
  gitlab-tofu init -no-color
}

@test "gitlab-tofu init without reconfigure" {
  gitlab-tofu init

  cat <<EOF > $GITLAB_TOFU_ROOT_DIR/backend_override.tf
  terraform {
    backend "local" {}
  }
EOF

  export GITLAB_TOFU_INIT_NO_RECONFIGURE="true"
  run ! gitlab-tofu init -no-color
  assert_output --partial "Error: Backend configuration changed"
}

@test "gitlab-tofu init with reconfigure" {
  cat <<EOF > $GITLAB_TOFU_ROOT_DIR/backend_override.tf
  terraform {
    backend "local" {}
  }
EOF
  gitlab-tofu init
}

@test "gitlab-tofu fmt" {
  gitlab-tofu fmt
}

@test "gitlab-tofu validate" {
  gitlab-tofu validate
}

@test "gitlab-tofu plan" {
  export GITLAB_TOFU_PLAN_CACHE="test-plan.cache"
  gitlab-tofu plan
  if [ ! -f "$GITLAB_TOFU_ROOT_DIR/$GITLAB_TOFU_PLAN_CACHE" ]; then
    echo "expected to find a plan.cache file"
    exit 1
  fi

  gitlab-tofu plan-json
  if [ ! -f "$GITLAB_TOFU_ROOT_DIR/plan.json" ]; then
    echo "expected to find a plan.json file"
    exit 1
  fi
}

@test "gitlab-tofu apply" {
  export GITLAB_TOFU_PLAN_CACHE="test-plan.cache"
  gitlab-tofu plan
  gitlab-tofu apply
}

@test "gitlab-tofu destroy" {
  export GITLAB_TOFU_PLAN_CACHE="test-plan.cache"
  gitlab-tofu plan
  gitlab-tofu apply
  gitlab-tofu destroy
}

@test "gitlab-tofu validate without implicit init" {
  export GITLAB_TOFU_IMPLICIT_INIT=false

  run ! gitlab-tofu validate -no-color
  assert_output --partial 'This module is not yet installed'
}

@test "gitlab-tofu plan without implicit init" {
  export GITLAB_TOFU_IMPLICIT_INIT=false

  run ! gitlab-tofu plan -no-color
  assert_output --partial 'Error: Backend initialization required'
}

@test "gitlab-tofu apply without implicit init" {
  export GITLAB_TOFU_IMPLICIT_INIT=false

  run ! gitlab-tofu apply -no-color
  assert_output --partial 'Error: Failed to load '
}

@test "gitlab-tofu destroy without implicit init" {
  export GITLAB_TOFU_IMPLICIT_INIT=false

  run ! gitlab-tofu destroy -no-color
  assert_output --partial 'Error: Backend initialization required'
}

@test "gitlab-tofu no wrap" {
  # NOTE: running `gitlab-tofu apply` wouldn't fail
  #       because of the implicit `tofu init`.
  run gitlab-tofu -- apply -no-color
  assert_failure
  assert_output --partial 'Error: Backend initialization required, please run "tofu init"'
}

# bats test_tags=source
@test "gitlab-tofu source" {
  test -n "$SHELL"

  cat <<'EOF' > test.sh
set -x
test -z "$GITLAB_TOFU_SOURCED"
. $(which gitlab-tofu)
test "$GITLAB_TOFU_SOURCED"
EOF

  $SHELL test.sh
}

# bats test_tags=source
@test "gitlab-tofu source not calling tofu binary" {
  test -n "$SHELL"

  cat <<'EOF' > test.sh
set -x
test -z "$GITLAB_TOFU_SOURCED"
. $(which gitlab-tofu)
test "$GITLAB_TOFU_SOURCED"
EOF

  mkdir -p /usr/local/sbin
  cat <<'EOF' > /usr/local/sbin/tofu
#!/usr/bin/env sh -e
echo "Called tofu, but shouldn't have!!"
false
EOF
  chmod +x /usr/local/sbin/tofu

  $SHELL test.sh
}

# bats test_tags=source
@test "gitlab-tofu source state name auto urlencode" {
  test -n "$SHELL"

  cat <<'EOF' > test.sh
set -x
export GITLAB_TOFU_STATE_NAME=production/europe
. $(which gitlab-tofu)
test "$backend_state_name" = "production%2Feurope"
EOF

  $SHELL test.sh
}

# bats test_tags=source
@test "gitlab-tofu source init with prepared registry token" {
  test -n "$SHELL"

cat <<'EOF' > test.sh
set -x
# NOTE: as part of the test fixture, we need to overwrite the CI_SERVER_HOST,
# so that this test also properly works on GitLab self-managed.
export CI_SERVER_HOST=gitlab.example.com
export TF_TOKEN_gitlab_example_com=mysecrettoken
. $(which gitlab-tofu)
tofu_authenticate_private_registry
test "$TF_TOKEN_gitlab_example_com" = "mysecrettoken"
EOF

  $SHELL test.sh
}

# bats test_tags=source
@test "gitlab-tofu source init without prepared registry token" {
  test -n "$SHELL"

cat <<'EOF' > test.sh
set -x
# NOTE: as part of the test fixture, we need to overwrite the CI_SERVER_HOST,
# so that this test also properly works on GitLab self-managed.
export CI_SERVER_HOST=gitlab.example.com
export TF_TOKEN_gitlab_example_com=mysecrettoken
. $(which gitlab-tofu)
tofu_authenticate_private_registry
test "$TF_TOKEN_gitlab_example_com" = "mysecrettoken"
EOF

  $SHELL test.sh
}
