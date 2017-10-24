#!/bin/bash
set -e

/srv/web/urbem/vendor/bin/consumer -r queue_1 -x exchange_1 -c /srv/web/urbem/bin/console -e prod -p ~/queue.pid --host web-rabbitmq.prod