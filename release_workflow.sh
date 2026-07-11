#!/bin/bash
# Production script to automate creating and pushing a release branch
set -e # Exit immediately if a command exits with a non-zero status

# Require a version number to be passed as an argument
if [ -z "$1" ]; then
  echo "Error: Release version required. Usage: bash release_workflow.sh v1.2.0"
  exit 1
fi

RELEASE_VERSION=$1
BRANCH_NAME="release/$RELEASE_VERSION"

echo "1. Creating and checking out new release branch: $BRANCH_NAME"
git checkout -b $BRANCH_NAME

echo "2. Updating version.txt..."
echo "VERSION=$RELEASE_VERSION" > version.txt
git add version.txt

echo "3. Committing the version bump..."
git commit -m "chore: bump version to $RELEASE_VERSION"

echo "4. Tagging the release..."
git tag -a $RELEASE_VERSION -m "Release $RELEASE_VERSION"

echo "5. Pushing branch and tags to GitHub..."
git push origin $BRANCH_NAME
git push origin $RELEASE_VERSION

echo "Release $RELEASE_VERSION successfully pushed to GitHub!"
