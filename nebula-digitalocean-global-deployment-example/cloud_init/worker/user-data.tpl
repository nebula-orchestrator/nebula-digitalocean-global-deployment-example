#cloud-config
rancher:
  resize_device: /dev/vda
  sysctl:
    net.ipv4.conf.default.rp_filter: 1
    net.ipv4.ip_forward: 0
    net.ipv4.conf.default.accept_source_route: 0
    kernel.sysrq: 0
    kernel.core_uses_pid: 1
    net.ipv4.tcp_syncookies: 1
    kernel.msgmnb: 65536
    kernel.msgmax: 65536
    kernel.shmmax: 68719476736
    kernel.shmall: 4294967296
    fs.file-max: 10000000
    fs.nr_open: 10000000
    net.ipv4.ip_local_port_range: 10000 65535
    net.ipv4.tcp_max_syn_backlog: 300000
    net.core.somaxconn: 10000
    net.core.rmem_max: 16777216
    net.ipv4.tcp_tw_reuse: 1
    net.core.wmem_max: 16777216
    net.ipv4.tcp_fin_timeout: 60
write_files:
  - path: /etc/rc.local
    permissions: "0755"
    owner: root
    content: |
      #!/bin/bash
      wait-for-docker
      docker run -d --restart unless-stopped -v /var/run/docker.sock:/var/run/docker.sock --env DEVICE_GROUP=example --env REGISTRY_HOST=https://index.docker.io/v1/ --env MAX_RESTART_WAIT_IN_SECONDS=0 --env NEBULA_MANAGER_AUTH_USER=nebula --env NEBULA_MANAGER_AUTH_PASSWORD=nebula --env NEBULA_MANAGER_HOST=${manager_host} --env NEBULA_MANAGER_PORT=80 --env nebula_manager_protocol=http --env NEBULA_MANAGER_CHECK_IN_TIME=5 --name nebula-worker nebulaorchestrator/worker
      sudo dd if=/dev/zero of=/swapfile bs=1k count=2000000
      sudo chmod 600 /swapfile
      sudo mkswap /swapfile
      sudo swapon /swapfile