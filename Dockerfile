#                          _            _
#  ___  __ _ ___ _   _  __| | ___   ___| | __
# / _ \/ _` / __| | | |/ _` |/ _ \ / __| |/ /
#|  __/ (_| \__ \ |_| | (_| | (_) | (__|   <
# \___|\__,_|___/\__, |\__,_|\___/ \___|_|\_\
#                |___/
#
#
# easydock is designed to make building reusable docker containers easier.
#
# With easydock you can easily build a docker machine that will work with
# linking, Marathon and other tools relatively easy. The main thing provided
# is a bash script that easily grabs port and address information from the
# environment and help you configure your container at bootup. The goal is
# that the process you wish to launch ends up as PID 1.

# You can base your image off whatever you like
FROM library/centos:centos7

# Docker Image Details
MAINTAINER Daniel Hall <easydock@danielhall.me>
CMD ["/opt/app/bin/boot"]

# Install easydock
ADD easydock.sh /opt/easydock/easydock.sh

# Install the app bootfile and configs
ADD app /opt/app

