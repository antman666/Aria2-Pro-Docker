#     _         _       ____    ____
#    / \   _ __(_) __ _|___ \  |  _ \ _ __ ___
#   / _ \ | '__| |/ _` | __) | | |_) | '__/ _ \
#  / ___ \| |  | | (_| |/ __/  |  __/| | | (_) |
# /_/   \_\_|  |_|\__,_|_____| |_|   |_|  \___/
#
# https://github.com/P3TERX/Aria2-Pro-Docker
#
# Copyright (c) 2020-2021 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.

FROM antman666/s6-alpine

COPY rootfs /
COPY aria2-install.sh /root

RUN apk add --no-cache jq findutils && \
    bash /root/aria2-install.sh && \
    rm -rf /var/cache/apk/* /tmp/* /root/aria2-install.sh

ENV S6_BEHAVIOUR_IF_STAGE2_FAILS=1 \
    RCLONE_CONFIG=/config/rclone.conf \
    UPDATE_TRACKERS=true \
    CUSTOM_TRACKER_URL= \
    LISTEN_PORT=6888 \
    RPC_PORT=6800 \
    RPC_SECRET= \
    PUID= PGID= \
    DISK_CACHE= \
    IPV6_MODE= \
    UMASK_SET= \
    SPECIAL_MODE=

EXPOSE \
    6800 \
    6888 \
    6888/udp

VOLUME \
    /config \
    /downloads
