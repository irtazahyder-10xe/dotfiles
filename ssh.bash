#!/usr/bin/env bash

user='irtazah-10x'
ip="$SERVER_IP"
ssh_key="server-key"

remote_port="1019"
remote="$user@$ip"

# Generating a eda25519 key
ssh-keygen -t eda25519 ~/.ssh/"$ssh_key"

ssh-copy-id -p $remote_port "$remote"

# Trying to connect to the server
ssh -p $remote_port "$remote"
