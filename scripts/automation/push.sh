#!/bin/bash

source config.env

function github-branch-commit() {
    local ref
    if [[ -n "$GITHUB_REF" ]]; then
        ref="$GITHUB_REF"
    elif [[ -n "$CI_COMMIT_REF_NAME" ]]; then
        ref="$CI_COMMIT_REF_NAME"
    fi
    msg "Ref $ref"
    GIT_BRANCH=${ref##*/}
    msg "Branch: ($GIT_BRANCH)"
    local head_ref branch_ref
    head_ref=$(git rev-parse HEAD)
    git config --global user.email "$EMAIL"
    git config --global user.name "$NAME" 
    if [[ $? -ne 0 || ! $head_ref ]]; then
        err "failed to get HEAD reference"
        return 1
    fi

    # In GitLab, sometimes we are in detached HEAD state or on the branch already.
    # We try to ensure we are on the branch.
    branch_ref=$(git rev-parse "$GIT_BRANCH" 2>/dev/null)
    if [[ $? -ne 0 || ! $branch_ref ]]; then
        # Try fetching origin
        git fetch origin "$GIT_BRANCH"
        branch_ref=$(git rev-parse FETCH_HEAD)
        if [[ $? -ne 0 || ! $branch_ref ]]; then
           err "failed to get $GIT_BRANCH reference"
           return 1
        fi
    fi

    if [[ $head_ref != $branch_ref ]]; then
        msg "HEAD ref ($head_ref) does not match $GIT_BRANCH ref ($branch_ref)"
        msg "someone may have pushed new commits before this build cloned the repo"
        # In GitLab CI, we might want to continue or fail.
        # But existing logic returns 0.
        return 0
    fi

    # Checkout branch if not already on it
    current_branch=$(git rev-parse --abbrev-ref HEAD)
    if [[ "$current_branch" != "$GIT_BRANCH" ]]; then
        if ! git checkout "$GIT_BRANCH"; then
            err "failed to checkout $GIT_BRANCH"
            return 1
        fi
    fi

    if ! git add component-definitions; then
        err "failed to add modified files to git index"
        return 1
    fi
    if ! git add md_components; then
        err "failed to add modified files to git index"
        return 1
    fi
    if [ -z "$(git status --porcelain)" ]; then 
        msg "Nothing to commit" 
        return 0 
    fi
    # make Github CI skip this build (and GitLab via [skip ci] usually, but [ci skip] also works on GitLab)
    if ! git commit -m "Autoupdate [ci skip]" -s; then
        err "failed to commit updates"
        return 1
    fi
    if [[ $GIT_BRANCH = main ]]; then
    	if [ -z  "${VERSION_TAG}" ]; then
    		msg "Nothing to push, version unchanged" 
        	return 0 
    	fi
        echo "Version tag: ${VERSION_TAG}" 
        # Check if tag exists on remote
        if git ls-remote --tags origin "v${VERSION_TAG}" | grep -q "v${VERSION_TAG}"; then
             msg "Tag v${VERSION_TAG} exists on remote, deleting..."
             if ! git push --delete origin "v${VERSION_TAG}"; then
                err "failed to delete git tag: v${VERSION_TAG}"
                return 1
             fi
        fi

        # Also check local tag and delete it if exists
        if git rev-parse "v${VERSION_TAG}" >/dev/null 2>&1; then
             git tag -d "v${VERSION_TAG}"
        fi

        echo "Adding version tag v${VERSION_TAG} to branch $GIT_BRANCH"
        if ! git tag "v${VERSION_TAG}" -m "Bump version"; then
            err "failed to create git tag: v${VERSION_TAG}"
            return 1
        fi
    fi
    
    local remote=origin
    if [[ $GIT_TOKEN ]]; then
        remote=$URL_COMPONENT_DEFINITION
    fi
    if [[ $GIT_BRANCH != main ]] && [[ $GIT_BRANCH != develop ]]; then
        msg "not pushing updates to branch $GIT_BRANCH"
        return 0
    fi
    if ! git push --quiet --follow-tags "$remote" "$GIT_BRANCH" ; then
        err "failed to push git changes"
        return 1
    fi
}

function msg() {
    echo "github-commit: $*"
}

function err() {
    msg "$*" 1>&2
}

COUNT_COMPONENT_DEFINITIONS=$(ls -1 component-definitions | wc -l)
COUNT_COMPONENT_DEFINITIONS_MD=$(ls -1 md_components | wc -l)
if [ "$COUNT_COMPONENT_DEFINITIONS" == "0" ] || [ "$COUNT_COMPONENT_DEFINITIONS_MD" == "0" ]
then
    echo "no component-definition or markdown present -> nothing to do"
else
	github-branch-commit
fi
