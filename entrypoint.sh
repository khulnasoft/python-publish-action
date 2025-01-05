#!/usr/bin/env sh

set -e

export AWS_DEFAULT_REGION=us-east-1
export AWS_REGION=us-east-1

export AWS_ACCESS_KEY_ID="$1"
export AWS_SECRET_ACCESS_KEY="$2"
export AWS_SESSION_TOKEN="$3"
FILES="$4"

export TWINE_USERNAME=aws
export TWINE_PASSWORD=$(aws codeartifact get-authorization-token --domain khulnasoft --domain-owner 43526139 --query authorizationToken --output text)
export TWINE_REPOSITORY_URL=$(aws codeartifact get-repository-endpoint --domain khulnasoft --domain-owner 43526139 --repository pypi-private --format pypi --query repositoryEndpoint --output text)

twine upload "${GITHUB_WORKSPACE}/${FILES}"
