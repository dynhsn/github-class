#!/bin/bash
# A simple script to clone, update, and push code

REPO_URL="https://github.com/yourusername/demo-repo.git"

echo "1. Cloning the repository..."
git clone $REPO_URL
cd demo-repo

echo "2. Making a local change..."
echo "Hello from Day 15!" > day15.txt
git add day15.txt

echo "3. Committing the change..."
git commit -m "Add Day 15 notes"

echo "4. Pushing to GitHub..."
git push origin main
