#!/bin/bash

MY_MFA_DEVICE=<my-mfa-device-arn>

if [ $# -lt 2 ]
then
    echo "Usage: ${0} <my-profile> <my-mfa-token>"
    echo "  Configures a new profile, <my-profile>-mfa, with session"
    echo "Example: ${0} dev 123456"
    echo "  Produces profile 'dev-mfa'"
    echo "  aws s3 ls --profile dev-mfa"
    exit 2
fi
function set-mfa {
    aws configure set region $2 --profile $1-mfa
    aws configure set aws_access_key_id $3 --profile $1-mfa
    aws configure set aws_secret_access_key $4 --profile $1-mfa
    aws configure set aws_session_token $5 --profile $1-mfa
    echo "Configured profile '${1}-mfa', with session"
}
set-mfa $1 $(aws configure get region --profile $1) $(aws sts get-session-token --profile $1 --serial-number $MY_MFA_DEVICE --token-code $2 --query 'Credentials.[AccessKeyId,SecretAccessKey,SessionToken]' --output text)
