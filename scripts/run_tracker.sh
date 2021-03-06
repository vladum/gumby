#!/bin/bash -xe
# run_tracker.sh ---
#
# Filename: run_tracker.sh
# Description:
# Author: Elric Milon
# Maintainer:
# Created: Fri Jun 14 12:44:06 2013 (+0200)

# Commentary:
# This script looks for a free UDP port and starts the tracker listening on it.
# It also writes the port to the experiment config file so other scripts can use it.
#
#

# Change Log:
#
#
#
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License as
# published by the Free Software Foundation; either version 3, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; see the file COPYING.  If not, write to
# the Free Software Foundation, Inc., 51 Franklin Street, Fifth
# Floor, Boston, MA 02110-1301, USA.
#
#

# Code:

# find_free_port ()
# {
#     while true; do
#         TRACKER_PORT=$[ ( $RANDOM % 65535 )  + 1 ]
#         lsof -iudp -n -P | awk '{ print $9 }' | grep -q "^*:$TRACKER_PORT$" || ( echo "No one is listening in $TRACKER_PORT" >&2 ; break )
#     done
# }
#
#Find an unused port
#find_free_port
#echo "TRACKER_PORT=$TRACKER_PORT" >> experiment_run.conf

cd $PROJECTROOT

python -O -c "from dispersy.tool.tracker import main; main()" --port $TRACKER_PORT > "$PROJECTROOT/output/tracker_out.log"

#
# run_tracker.sh ends here
