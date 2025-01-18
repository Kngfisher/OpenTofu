#!/usr/bin/env sh

# gitlab-tofu is a wrapper around the tofu command
# from the OpenTofu project.
#
# It's main purpose is to setup tofu to work inside
# GitLab pipelines and together with the
# OpenTofu CI/CD component.
# Detailed information about it is in the README:
# https://gitlab.com/components/opentofu
#
# %%%%
#
# #### Respected Environment Variables
#
# - `GITLAB_TOFU_DEBUG`: if set to true will enable xtrace.
# - `GITLAB_TOFU_SOURCE`: forces this script in source-mode. Required when source auto-detection fails.
# - `GITLAB_TOFU_APPLY_NO_PLAN`: if set to true, the apply command does not use a plan cache file.
# - `GITLAB_TOFU_PLAN_NAME`: the name of the plan cache and json files. Defaults to `plan`.
# - `GITLAB_TOFU_PLAN_CACHE`: if set to the full path of the plan cache file. Defaults to `<root>/$GITLAB_TOFU_PLAN_NAME.cache`
# - `GITLAB_TOFU_PLAN_JSON`: if set to the full path of the plan json file. Defaults to `<root>/$GITLAB_TOFU_PLAN_NAME.json`
# - `GITLAB_TOFU_IMPLICIT_INIT`: if set to true will perform an implicit `tofu init` before any command that require it. Defaults to `true`.
# - `GITLAB_TOFU_IGNORE_INIT_ERRORS`: if set to true will ignore errors in the `tofu init` command.
# - `GITLAB_TOFU_INIT_NO_RECONFIGURE`: if set to true will not pass `-reconfigure` to the `tofu init` command. Defaults to `false`.
# - `GITLAB_TOFU_STATE_NAME`: the name of the GitLab-managed Terraform state backend endpoint.
# - `GITLAB_TOFU_STATE_ADDRESS`: the address of the GitLab-managed Terraform state backend. Defaults to `$CI_API_V4_URL/projects/$CI_PROJECT_ID/terraform/state/$GITLAB_TOFU_STATE_NAME`.
# - `GITLAB_TOFU_USE_DETAILED_EXITCODE`: if set to true, `-detailed-exitcode` is supplied to `tofu plan`. Defaults to `false`.
# - `GITLAB_TOFU_PLAN_WITH_JSON`: if set to true, will directly generate a JSON plan file when running `gitlab-tofu plan`. Defaults to `false`.
# - `GITLAB_TOFU_VAR_FILE`: if set to a path it will pass `-var-file` to all `tofu` commands that support it.
# - `GITLAB_TOFU_AUTO_ENCRYPTION`: if set to true, enables auto state and plan encryption. Defaults to `false`.
# - `GITLAB_TOFU_AUTO_ENCRYPTION_PASSPHRASE`: the passphrase to use for state and plan encryption. Required if `GITLAB_TOFU_AUTO_ENCRYPTION` is true.
# - `GITLAB_TOFU_AUTO_ENCRYPTION_ENABLE_MIGRATION_FROM_UNENCRYPTED_ENABLED`: if set to true, enables a fallback for state and plan encryption to migrate unencrypted plans and states to encrypted ones. Defaults to `false`.
# - `GITLAB_TOFU_ALLOW_DEVELOPER_ROLE: Users with the Developer role are not able to lock the state. Thus a regular `tofu plan` fails. When set to `true` a `-lock=false` is passed to plan.
#
# #### Respected OpenTofu Environment Variables
#
# > these are variables that are
# > respected if set and avoid using
# > the gitlab-tofu values for them.
#
# - `TF_HTTP_USERNAME`: username for the HTTP backend. Defaults to `gitlab-ci-token`.
# - `TF_HTTP_PASSWORD`: password for the HTTP backend. Defaults to `$CI_JOB_TOKEN`.
# - `TF_HTTP_ADDRESS`: address for the HTTP backend. Defaults to `$CI_API_V4_URL/projects/$CI_PROJECT_ID/terraform/state/<urlencode($GITLAB_TOFU_STATE_NAME)>`.
# - `TF_HTTP_LOCK_ADDRESS`: lock address for the HTTP backend. Defaults to `$TF_HTTP_ADDRESS/lock`.
# - `TF_HTTP_LOCK_METHOD`: lock method for the HTTP backend. Defaults to `POST`.
# - `TF_HTTP_UNLOCK_ADDRESS`: unlock address for the HTTP backend. Defaults to `lock`.
# - `TF_HTTP_UNLOCK_METHOD`: unlock address for the HTTP backend. Defaults to `unlock`.
# - `TF_HTTP_RETRY_WAIT_MIN`: retry minimum waiting time in seconds. Defaults to `5`.
# - `TF_CLI_CONFIG_FILE`: config file path. Defaults to `$HOME/.terraformrc` if it exists.
#
# #### Respected GitLab CI/CD Variables
#
# > these are variables exposed by
# > GitLab CI/CD and respected by
# > the gitlab-tofu script for
# > certain configurations.
#
# - `CI_JOB_TOKEN`:
#   - used as default value for `TF_HTTP_PASSWORD`.
#   - used as value for `TF_TOKEN_<host>` variable.
# - `CI_PROJECT_DIR`:
#   - used as default value for root directory.
# - `CI_PROJECT_ID`:
#   - used as default value in constructing the `GITLAB_TOFU_STATE_ADDRESS`.
# - `CI_API_V4_URL`:
#   - used as default value in constructing the `GITLAB_TOFU_STATE_ADDRESS`.
# - `CI_SERVER_HOST`:
#   - used to construct for `TF_TOKEN_<host>` variable.
# - `CI_SERVER_PROTOCOL`:
#   - used to construct for `TF_TOKEN_<host>` variable.
#
# %%%%

# set some shell options
set -o errexit

if [ "${GITLAB_TOFU_DEBUG}" = "true" ]; then
    set -o xtrace
fi

# Feature Flags
# =============
# Below are a bunch of variables that we use as "feature flags".

# There are no feature flags at the moment.

# Source Mode
# ===========
# Evaluate if this script is being sourced or executed directly.
# See https://stackoverflow.com/a/28776166
sourced=0
# shellcheck disable=SC2153 # it's actually a different variable, thanks shelllcheck.
if [ "$GITLAB_TOFU_SOURCE" = 'true' ]; then
  sourced=1
elif [ -n "$ZSH_VERSION" ]; then
  case $ZSH_EVAL_CONTEXT in *:file) sourced=1;; esac
elif [ -n "$KSH_VERSION" ]; then
  # shellcheck disable=SC2296
  [ "$(cd -- "$(dirname -- "$0")" && pwd -P)/$(basename -- "$0")" != "$(cd -- "$(dirname -- "${.sh.file}")" && pwd -P)/$(basename -- "${.sh.file}")" ] && sourced=1
elif [ -n "$BASH_VERSION" ]; then
  (return 0 2>/dev/null) && sourced=1
else # All other shells: examine $0 for known shell binary filenames.
     # Detects `sh` and `dash`; add additional shell filenames as needed.
  case ${0##*/} in sh|-sh|dash|-dash) sourced=1;; esac
fi

# Dependencies
# ============
# Defines all the external dependencies and checks if they exist, if not, abort with an error.
dependencies="dirname basename pwd sed idn2 jq tofu"

if [ -n "$ZSH_VERSION" ]; then
  # ZSH is the only supported SHELL that does not split by word by default,
  # so we set this option to actually do it.
  setopt sh_word_split
fi

for dep in $dependencies; do
  if ! command -v "$dep" >/dev/null 2>&1; then
    echo "Error: gitlab-tofu is missing dependency: '$dep'" >&2
    exit 1
  fi
done

if [ -n "$ZSH_VERSION" ]; then
  # see comment above when setting sh_word_split.
  unsetopt sh_word_split
fi

# Deprecations
# ============
if [ -n "$TF_STATE_NAME" ]; then
  echo 'WARNING: you have manually set the deprecated TF_STATE_NAME environment variable. Please use the GITLAB_TOFU_STATE_NAME environment variable instead. The TF_STATE_NAME variable will be removed soon.' >&2

  if [ -n "$GITLAB_TOFU_STATE_NAME" ]; then
    echo 'WARNING: you have set GITLAB_TOFU_STATE_NAME environment variable in addition to the deprecated TF_STATE_NAME. This causes a conflict and GITLAB_TOFU_STATE_NAME will be used exclusively' >&2
  else
    GITLAB_TOFU_STATE_NAME="$TF_STATE_NAME"
  fi
fi

if [ -n "$TF_ADDRESS" ]; then
  echo 'WARNING: you have manually set the deprecated TF_ADDRESS environment variable. Please use the GITLAB_TOFU_STATE_ADDRESS environment variable instead. The TF_ADDRESS variable will be removed soon.' >&2

  if [ -n "$GITLAB_TOFU_STATE_ADDRESS" ]; then
    echo 'WARNING: you have set GITLAB_TOFU_STATE_ADDRESS environment variable in addition to the deprecated TF_ADDRESS. This causes a conflict and GITLAB_TOFU_STATE_ADDRESS will be used exclusively' >&2
  else
    GITLAB_TOFU_STATE_ADDRESS="$TF_ADDRESS"
  fi
fi

if [ -n "$TF_ROOT" ]; then
  echo 'WARNING: you have manually set the deprecated TF_ROOT environment variable. Please use the GITLAB_TOFU_ROOT_DIR environment variable instead. The TF_ROOT variable will be removed soon.' >&2

  if [ -n "$GITLAB_TOFU_ROOT_DIR" ]; then
    echo 'WARNING: you have set GITLAB_TOFU_ROOT_DIR environment variable in addition to the deprecated TF_ROOT. This causes a conflict and GITLAB_TOFU_ROOT_DIR will be used exclusively' >&2
  else
    GITLAB_TOFU_ROOT_DIR="$TF_ROOT"
  fi
fi

# Handle environment variables
# ============================

# Backend related variables
backend_username="gitlab-ci-token"
backend_password="${CI_JOB_TOKEN}"
backend_state_name="$(jq -rn --arg x "${GITLAB_TOFU_STATE_NAME:-default}" '$x|@uri')"
backend_address="${GITLAB_TOFU_STATE_ADDRESS:-${CI_API_V4_URL}/projects/${CI_PROJECT_ID}/terraform/state/${backend_state_name}}"

# Root directory related variables
base_plan_name="${GITLAB_TOFU_PLAN_NAME:-plan}"
if [ -n "${GITLAB_TOFU_ROOT_DIR}" ]; then
  abs_tf_root=$(cd "${CI_PROJECT_DIR}"; realpath "${GITLAB_TOFU_ROOT_DIR}")

  tf_chdir_opt="-chdir=${abs_tf_root}"

  default_tf_plan_cache="${abs_tf_root}/${base_plan_name}.cache"
  default_tf_plan_json="${abs_tf_root}/${base_plan_name}.json"
fi

# Init related variables
init_flags=${GITLAB_TOFU_INIT_FLAGS}
should_do_implicit_init=${GITLAB_TOFU_IMPLICIT_INIT:-true}
should_ignore_init_errors=${GITLAB_TOFU_IGNORE_INIT_ERRORS:-false}
should_init_without_reconfigure=${GITLAB_TOFU_INIT_NO_RECONFIGURE:-false}

# Plan variables
apply_without_plan=${GITLAB_TOFU_APPLY_NO_PLAN:-false}
plan_cache_path="${GITLAB_TOFU_PLAN_CACHE:-${default_tf_plan_cache:-${base_plan_name}.cache}}"
plan_json_path="${GITLAB_TOFU_PLAN_JSON:-${default_tf_plan_json:-${base_plan_name}.json}}"
plan_with_detailed_exitcode=${GITLAB_TOFU_USE_DETAILED_EXITCODE:-false}
plan_with_json_file=${GITLAB_TOFU_PLAN_WITH_JSON:-false}
plan_jq_filter='
  (
    [.resource_changes[]?.change.actions?] | flatten
  ) | {
    "create":(map(select(.=="create")) | length),
    "update":(map(select(.=="update")) | length),
    "delete":(map(select(.=="delete")) | length)
  }
'
allow_developer_role=${GITLAB_TOFU_ALLOW_DEVELOPER_ROLE:-false}

# auto encryption related variables
auto_encryption_enabled=${GITLAB_TOFU_AUTO_ENCRYPTION:-false}
auto_encryption_passphrase="${GITLAB_TOFU_AUTO_ENCRYPTION_PASSPHRASE}"
auto_encryption_migration_from_unencrypted_enabled=${GITLAB_TOFU_AUTO_ENCRYPTION_ENABLE_MIGRATION_FROM_UNENCRYPTED:-false}
if $auto_encryption_enabled && [ -z "${auto_encryption_passphrase}" ]; then
  # shellcheck disable=SC2016 # we actually want to print the variable names and not expand them.
  echo 'ERROR: a passphrase ($GITLAB_TOFU_AUTO_ENCRYPTION_PASSPHRASE) must be provided when enabled auto encryption ($GITLAB_TOFU_AUTO_ENCRYPTION)' >&2
  exit 1
fi
if ! $auto_encryption_enabled && $auto_encryption_migration_from_unencrypted_enabled; then
  # shellcheck disable=SC2016 # we actually want to print the variable names and not expand them.
  echo 'ERROR: you must enable auto encryption ($GITLAB_TOFU_AUTO_ENCRYPTION) to enable migration from an unencrypted state ($GITLAB_TOFU_AUTO_ENCRYPTION_ENABLE_MIGRATION_FROM_UNENCRYPTED)' >&2
  exit 1
fi

# Misc variables
var_file="${GITLAB_TOFU_VAR_FILE}"
var_file_args=""
if [ -n "${var_file}" ]; then
  var_file_args="--var-file=${var_file}"
fi

# Helper functions
# ================

# configure_variables_for_tofu sets and exports all relevant variables for subsequent `tofu` command invocations.
configure_variables_for_tofu() {
  # Use terraform automation mode (will remove some verbose unneeded messages)
  export TF_IN_AUTOMATION=true

  # Set variables for the HTTP backend to default to TF_* values
  export TF_HTTP_ADDRESS="${TF_HTTP_ADDRESS:-${backend_address}}"
  export TF_HTTP_LOCK_ADDRESS="${TF_HTTP_LOCK_ADDRESS:-${backend_address}/lock}"
  export TF_HTTP_LOCK_METHOD="${TF_HTTP_LOCK_METHOD:-POST}"
  export TF_HTTP_UNLOCK_ADDRESS="${TF_HTTP_UNLOCK_ADDRESS:-${backend_address}/lock}"
  export TF_HTTP_UNLOCK_METHOD="${TF_HTTP_UNLOCK_METHOD:-DELETE}"
  export TF_HTTP_USERNAME="${TF_HTTP_USERNAME:-${backend_username}}"
  export TF_HTTP_PASSWORD="${TF_HTTP_PASSWORD:-${backend_password}}"
  export TF_HTTP_RETRY_WAIT_MIN="${TF_HTTP_RETRY_WAIT_MIN:-5}"

  # Expose Gitlab specific variables to terraform since no -tf-var is available
  # The following variables are deprecated because they do not conform to
  # HCL naming best practices. Use the lower snake_case variants below instead.
  export TF_VAR_CI_JOB_ID="${TF_VAR_CI_JOB_ID:-${CI_JOB_ID}}"
  export TF_VAR_CI_COMMIT_SHA="${TF_VAR_CI_COMMIT_SHA:-${CI_COMMIT_SHA}}"
  export TF_VAR_CI_JOB_STAGE="${TF_VAR_CI_JOB_STAGE:-${CI_JOB_STAGE}}"
  export TF_VAR_CI_PROJECT_ID="${TF_VAR_CI_PROJECT_ID:-${CI_PROJECT_ID}}"
  export TF_VAR_CI_PROJECT_NAME="${TF_VAR_CI_PROJECT_NAME:-${CI_PROJECT_NAME}}"
  export TF_VAR_CI_PROJECT_NAMESPACE="${TF_VAR_CI_PROJECT_NAMESPACE:-${CI_PROJECT_NAMESPACE}}"
  export TF_VAR_CI_PROJECT_PATH="${TF_VAR_CI_PROJECT_PATH:-${CI_PROJECT_PATH}}"
  export TF_VAR_CI_PROJECT_URL="${TF_VAR_CI_PROJECT_URL:-${CI_PROJECT_URL}}"

  export TF_VAR_ci_job_id="${TF_VAR_ci_job_id:-${CI_JOB_ID}}"
  export TF_VAR_ci_commit_sha="${TF_VAR_ci_commit_sha:-${CI_COMMIT_SHA}}"
  export TF_VAR_ci_job_stage="${TF_VAR_ci_job_stage:-${CI_JOB_STAGE}}"
  export TF_VAR_ci_project_id="${TF_VAR_ci_project_id:-${CI_PROJECT_ID}}"
  export TF_VAR_ci_project_name="${TF_VAR_ci_project_name:-${CI_PROJECT_NAME}}"
  export TF_VAR_ci_project_namespace="${TF_VAR_ci_project_namespace:-${CI_PROJECT_NAMESPACE}}"
  export TF_VAR_ci_project_path="${TF_VAR_ci_project_path:-${CI_PROJECT_PATH}}"
  export TF_VAR_ci_project_url="${TF_VAR_ci_project_url:-${CI_PROJECT_URL}}"

  # Set a Terraform CLI Configuration File
  default_tf_cli_config_file="$HOME/.terraformrc"
  if [ -z "${TF_CLI_CONFIG_FILE}" ] && [ -f "${default_tf_cli_config_file}" ]; then
    export TF_CLI_CONFIG_FILE="${default_tf_cli_config_file}"
  fi
}

# tofu_authenticate_private_registry sets the TF_TOKEN_* variable to authenticate private registries.
tofu_authenticate_private_registry() {
  if [ "${CI_SERVER_PROTOCOL}" = "https" ] && [ -n "${CI_SERVER_HOST}" ]; then
    tf_token_var_name=TF_TOKEN_$(idn2 "${CI_SERVER_HOST}" | sed 's/\./_/g' | sed 's/-/__/g')
    # If TF_TOKEN_ for the Gitlab domain is not set then use the CI_JOB_TOKEN
    if [ -z "$(eval "echo \${${tf_token_var_name}:-}")" ]; then
      export "${tf_token_var_name}"="${CI_JOB_TOKEN}"
    fi
  fi
}

# tofu_init runs `tofu init` with all things considered.
tofu_init() {
  if ! $should_init_without_reconfigure; then
    tofu_init_reconfigure_flag='-reconfigure'
  fi

  # shellcheck disable=SC2086 # We want to allow word splitting here for `init_flags`
  tofu "${tf_chdir_opt}" init "${@}" -input=false ${tofu_init_reconfigure_flag} ${init_flags} ${var_file_args} 1>&2 || $should_ignore_init_errors
}


# configure_encryption_for_tofu configures automatic state and plan encryption
configure_encryption_for_tofu() {
  if ! $auto_encryption_enabled; then
    return
  fi

  if $auto_encryption_migration_from_unencrypted_enabled; then
    TF_ENCRYPTION=$(cat <<EOF
method "unencrypted" "gitlab_tofu_auto_encryption_migrate" {}

key_provider "pbkdf2" "gitlab_tofu_auto_encryption" {
  passphrase = "${auto_encryption_passphrase}"
}

method "aes_gcm" "gitlab_tofu_auto_encryption" {
  keys = key_provider.pbkdf2.gitlab_tofu_auto_encryption
}

state {
  method = method.aes_gcm.gitlab_tofu_auto_encryption

  fallback {
    method = method.unencrypted.gitlab_tofu_auto_encryption_migrate
  }
}

plan {
  method = method.aes_gcm.gitlab_tofu_auto_encryption

  fallback {
    method = method.unencrypted.gitlab_tofu_auto_encryption_migrate
  }
}
EOF
)
  else
    TF_ENCRYPTION=$(cat <<EOF
key_provider "pbkdf2" "gitlab_tofu_auto_encryption" {
  passphrase = "${auto_encryption_passphrase}"
}

method "aes_gcm" "gitlab_tofu_auto_encryption" {
  keys = key_provider.pbkdf2.gitlab_tofu_auto_encryption
}

state {
  method = method.aes_gcm.gitlab_tofu_auto_encryption
}

plan {
  method = method.aes_gcm.gitlab_tofu_auto_encryption
}
EOF
)
  fi

  export TF_ENCRYPTION
}

# We always want to configure the tofu variables, even in source-mode.
configure_variables_for_tofu
configure_encryption_for_tofu

# If this script is executed and not sourced, a tofu command is ran.
# Otherwise, nothing happens and the sourced shell can use the defined variables
# and helper functions exposed by this script.
if [ $sourced -eq 0 ]; then
  # Authenticate to private registry
  tofu_authenticate_private_registry

  case "${1}" in
    "apply")
      $should_do_implicit_init && tofu_init
      if ! $apply_without_plan; then
        tofu "${tf_chdir_opt}" "${@}" -input=false -auto-approve "${plan_cache_path}"
      else
        # shellcheck disable=SC2086
        tofu "${tf_chdir_opt}" "${@}" -input=false -auto-approve ${var_file_args}
      fi
    ;;
    "destroy")
      $should_do_implicit_init && tofu_init
      tofu "${tf_chdir_opt}" "${@}" -auto-approve
    ;;
    "fmt")
      tofu "${tf_chdir_opt}" "${@}" -check -diff -recursive
    ;;
    "init")
      # shift argument list „one to the left“ to not call 'terraform init init'
      shift
      tofu_init "${@}"
    ;;
    "plan")
      plan_args=''
      if $plan_with_detailed_exitcode; then
        plan_args='-detailed-exitcode'
      fi
      if $allow_developer_role; then
        plan_args="$plan_args -lock=false"
      fi

      $should_do_implicit_init && tofu_init
      # shellcheck disable=SC2086
      tofu "${tf_chdir_opt}" "${@}" -input=false -out="${plan_cache_path}" ${var_file_args} ${plan_args} && ret=$? || ret=$?

      if $plan_with_json_file; then
        if [ "$ret" -eq 0 ] || [ "$ret" -eq 2 ]; then
          if ! tofu "${tf_chdir_opt}" show -json "${plan_cache_path}" | jq -r "${plan_jq_filter}" > "${plan_json_path}"; then
            exit $?
          fi

          # NOTE: we want to exit with the tofu plan exit code if the tofu show command call is successful.
          exit "$ret"
        fi
      fi

      exit "$ret"
    ;;
    "plan-json")
      tofu "${tf_chdir_opt}" show -json "${plan_cache_path}" | jq -r "${plan_jq_filter}" > "${plan_json_path}"
    ;;
    "validate")
      $should_do_implicit_init && tofu_init -backend=false
      # shellcheck disable=SC2086
      tofu "${tf_chdir_opt}" "${@}" ${var_file_args}
    ;;
    "test")
      $should_do_implicit_init && tofu_init -backend=false
      # shellcheck disable=SC2086
      tofu "${tf_chdir_opt}" "${@}" ${var_file_args}
    ;;
    "graph")
      $should_do_implicit_init && tofu_init
      # shellcheck disable=SC2086
      tofu "${tf_chdir_opt}" "${@}" ${var_file_args}
    ;;
    --)
      shift
      tofu "${tf_chdir_opt}" "${@}"
    ;;
    *)
      tofu "${tf_chdir_opt}" "${@}"
    ;;
  esac
else
  # This variable can be used if the script is sourced
  # shellcheck disable=SC2034
  GITLAB_TOFU_SOURCED=true
fi
