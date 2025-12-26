#!/bin/bash

source config.env

export COMMIT_TITLE="chore: Components automatic update."
export COMMIT_BODY="Sync components with $PROFILE repo"

# Identify RUN_ID
if [ -n "$GITHUB_RUN_ID" ]; then
    RUN_ID="$GITHUB_RUN_ID"
elif [ -n "$CI_PIPELINE_ID" ]; then
    RUN_ID="$CI_PIPELINE_ID"
else
    RUN_ID="manual_$(date +%s)"
fi

git config --global user.email "$EMAIL"
git config --global user.name "$NAME"
cd "$REPO_COMPONENT_DEFINITION"
BRANCH_NAME="components_autoupdate_$RUN_ID"
git checkout -b "$BRANCH_NAME"
cp -r ../components-definitions .
if [ -z "$(git status --porcelain)" ]; then 
  echo "Nothing to commit"
else
  git add component-definitions
  if [ -z "$(git status --untracked-files=no --porcelain)" ]; then 
     echo "Nothing to commit"
  else
     git commit --message "$COMMIT_TITLE"
     remote=$URL_COMPONENT_DEFINITION
     git push -u "$remote" "$BRANCH_NAME"
     echo $COMMIT_BODY

     if [ -n "$GITHUB_ACTIONS" ]; then
         gh pr create -t "$COMMIT_TITLE" -b "$COMMIT_BODY" -B "develop" -H "$BRANCH_NAME"
     elif [ -n "$GITLAB_CI" ]; then
         if command -v glab &> /dev/null; then
             glab mr create -t "$COMMIT_TITLE" -d "$COMMIT_BODY" -b "develop" -s "$BRANCH_NAME" -y
         else
             # Construct Project Path from variables
             PROJECT_PATH="$REPO_BASE/$REPO_COMPONENT_DEFINITION"
             # URL encode project path for API: /projects/gpeavy%2Facme-component-definition/merge_requests
             ENCODED_PATH=$(echo "$PROJECT_PATH" | sed 's/\//%2F/g')

             curl --request POST --header "PRIVATE-TOKEN: $GIT_TOKEN" \
                 --header "Content-Type: application/json" \
                 --data "{ \"source_branch\": \"$BRANCH_NAME\", \"target_branch\": \"develop\", \"title\": \"$COMMIT_TITLE\", \"description\": \"$COMMIT_BODY\" }" \
                 "$CI_SERVER_URL/api/v4/projects/$ENCODED_PATH/merge_requests"
         fi
     fi
  fi
fi
