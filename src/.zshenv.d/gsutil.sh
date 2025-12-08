#!/bin/sh
# Workaround for https://github.com/GoogleCloudPlatform/gsutil/issues/576
gsutil() {
    command gsutil \
        -o 'GSUtil:parallel_process_count=1' \
        -o 'GSUtil:parallel_thread_count=16' \
        -m
}
