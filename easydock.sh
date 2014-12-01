#                          _            _
#  ___  __ _ ___ _   _  __| | ___   ___| | __
# / _ \/ _` / __| | | |/ _` |/ _ \ / __| |/ /
#|  __/ (_| \__ \ |_| | (_| | (_) | (__|   <
# \___|\__,_|___/\__, |\__,_|\___/ \___|_|\_\
#                |___/
#
# This file is meant to be sourced, not run.

function easydock_host_ip() {
  local __var="$1"

  eval $__var=$(ip route | awk '/^default/ {print $3}')
}

# This function is meant to get ports for services inside to bind to. On
# Marathon this will be in ${PORT0} .. ${PORTN}, otherwise use the defaults.
function easydock_get_bind_port() {
  local __var="$1"
  local portnum="$2"
  local default="$3"

  local port=""

  if [ -n ${PORT${portnum}} ]; then # Mesos Style
    local port=${PORT${portnum}}
  else
    local port=${default}
  fi

  eval $__var="${port}"
}

