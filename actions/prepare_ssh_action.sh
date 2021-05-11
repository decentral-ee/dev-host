# cleanup on finish
function finish {
  rm -f ssh.key
}
trap finish EXIT

# create temporary ssh key
echo "${INPUT_DEV_HOST_SSH_KEY}" > ssh.key
chmod 600 ssh.key

set -ex

SSH_OPTS="-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o LogLevel=ERROR"
