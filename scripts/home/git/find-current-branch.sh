#!/usr/bin/env bash

# Problem description:
# CodePipeline downloads the source as a zip from the source provider rather than doing a Git clone, which means
# the .git folder won’t be retained and git commands like the one you’re running won’t work.
# source: https://itnext.io/how-to-access-git-metadata-in-codebuild-when-using-codepipeline-codecommit-ceacf2c5c1dc

if [ -n "$CODEBUILD_RESOLVED_SOURCE_VERSION" ]
then
  echo CODEBUILD_RESOLVED_SOURCE_VERSION
  echo This variable contains the source revision provided by CodePipeline.
  echo "$CODEBUILD_RESOLVED_SOURCE_VERSION"
echo
fi

if [ -n "$CODEBUILD_SOURCE_VERSION" ]
then
  echo CODEBUILD_SOURCE_VERSION
  echo The commit ID or branch name associated with the version of the source code to be built.
  echo "$CODEBUILD_SOURCE_VERSION"
  echo
fi

if [ -n "$CODEBUILD_WEBHOOK_BASE_REF" ]
then
  echo CODEBUILD_WEBHOOK_BASE_REF
  echo The base reference name of the webhook event that triggers the current build. For a pull request, this is the branch reference.
  echo "$CODEBUILD_WEBHOOK_BASE_REF"
  echo
fi

if [ -n "$CODEBUILD_WEBHOOK_EVENT" ]
then
  echo CODEBUILD_WEBHOOK_EVENT
  echo The webhook event that triggers the current build.
  echo "$CODEBUILD_WEBHOOK_EVENT"
  echo
fi

if [ -n "$CODEBUILD_WEBHOOK_MERGE_COMMIT" ]
then
  echo CODEBUILD_WEBHOOK_MERGE_COMMIT
  echo The identifier of the merge commit used for the build. This variable is set when a Bitbucket pull request is merged with the squash strategy and the pull request branch is closed. In this case, the original pull request commit no longer exists, so this environment variable contains the identifier of the squashed merge commit.
  echo "$CODEBUILD_WEBHOOK_MERGE_COMMIT"
  echo
fi

if [ -n "$CODEBUILD_WEBHOOK_PREV_COMMIT" ]
then
  echo CODEBUILD_WEBHOOK_PREV_COMMIT
  echo The ID of the most recent commit before the webhook push event that triggers the current build.
  echo "$CODEBUILD_WEBHOOK_PREV_COMMIT"
  echo
fi

if [ -n "$CODEBUILD_WEBHOOK_HEAD_REF" ]
then
  echo CODEBUILD_WEBHOOK_HEAD_REF
  echo The head reference name of the webhook event that triggers the current build. It can be a branch reference or a tag reference.
  echo "$CODEBUILD_WEBHOOK_HEAD_REF"
  echo
fi

if [ -n "$CODEBUILD_WEBHOOK_TRIGGER" ]
then
  echo CODEBUILD_WEBHOOK_TRIGGER
  echo "Shows the webhook event that triggered the build. This variable is available only for builds triggered by a webhook. The value is parsed from the payload sent to CodeBuild by GitHub, GitHub Enterprise Server, or Bitbucket. The value's format depends on what type of event triggered the build."
  echo "$CODEBUILD_WEBHOOK_TRIGGER"
  echo
fi

if [[ "$CODEBUILD_SOURCE_VERSION" == refs/tags/* ]]
then
  git checkout "$CODEBUILD_SOURCE_VERSION"
  echo
  echo "INFO: A git tag found for this commit: $CODEBUILD_SOURCE_VERSION"
  echo "INFO: This is a final release. An artifact will be published into the releases repository."
  echo "Re-tagging recent branch, to make gradle happy..."
  rm -rf .git > /dev/null
  git init > /dev/null
  git add .
  git commit -m 'CodeBuild pipeline' > /dev/null
  git tag -a "$CODEBUILD_SOURCE_VERSION" -m 'temporary tag'
  echo Current tag from CODEBUILD_SOURCE_VERSION: "$CODEBUILD_SOURCE_VERSION"
  exit 0
fi

if [[ "$CODEBUILD_SOURCE_VERSION" == refs/heads/main ]]
then
  git checkout main
fi

IS_INCORRECTLY_CHECKED_OUT_BRANCH=$(git branch --contains HEAD | grep -F "* (no branch)")
if [ -z "$IS_INCORRECTLY_CHECKED_OUT_BRANCH" ]
then
  exit 0
else
  echo "Currently checked out branch is incorrect: * (no branch). Trying to resolve..."
fi

CURRENT_TAG=$(git tag --points-at HEAD | tail -1)
echo

if [ -z "$CURRENT_TAG" ]
then
  echo "Git tag not found. Searching for a feature branch which contains HEAD (recent commit)..."
  echo "List of candidates:"
  git branch -a --contains HEAD
  echo
  CURRENT_BRANCH=$(git branch --contains HEAD | grep -v remotes/origin | grep -v "(no branch)" | grep -v "(HEAD detached" | tail -1 | awk '{print $1}')
  echo Selected branch: "$CURRENT_BRANCH"
  git checkout "$CURRENT_BRANCH"
else
  echo "INFO: A git tag found for this commit: $CURRENT_TAG"
  echo "Checking out main..."
  git checkout main
  echo "Verifying tag policy..."
  CURRENT_TAG_FROM_MAIN=$(git tag --points-at HEAD | tail -1)
  echo current tag: "$CURRENT_TAG_FROM_MAIN"
  if [ -z "$CURRENT_TAG_FROM_MAIN" ]
  then
    echo "ERROR: Currently, releasing artifacts is only possible from the main branch."
    echo "If your tag was not created from the main branch, it will not be published into the releases repository."
    echo "To fix this, please merge your changes into main. Then create git tag there."
  elif [ "$CURRENT_TAG" != "$CURRENT_TAG_FROM_MAIN" ]
  then
    echo "ERROR: Two candidates found. Cannot resolve."
    echo "ERROR: Currently, releasing artifacts is only possible from the main branch."
    echo "If your tag was not created from the main branch, it will not be published into the releases repository."
    echo "To fix this, please merge your changes into main. Then create git tag there."
  else
    echo
    echo "INFO: This is a final release. An artifact will be published into the releases repository."
    echo "Re-tagging recent branch, to make gradle happy..."
    rm -rf .git > /dev/null
    git init > /dev/null
    git add .
    git commit -m 'CodeBuild pipeline' > /dev/null
    git tag -a "$CURRENT_TAG_FROM_MAIN" -m 'temporary tag'
    echo Current tag from main branch: "$CURRENT_TAG_FROM_MAIN"
  fi
fi
