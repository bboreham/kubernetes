/usr/bin/weave:
  file.managed:
    - source: https://github.com/weaveworks/weave/releases/download/v1.6.0/weave
    - source_hash: sha256=6fb809dcf53e4323d200ce5a75490e419b099ac9821611b842eb9d48d752d4ed
    - makedirs: True
    - mode: 755

/opt/cni/bin/weave-net:
  file.managed:
    - source: https://github.com/weaveworks/weave/releases/download/v1.6.0/cni-plugin
    - source_hash: sha256=60435d9a525ce457ace4a97e6ce4e357d0d01fe72e7a0273ca034f07970665d7
    - makedirs: True
    - mode: 755

/opt/cni/bin/weave-ipam:
  file.managed:
    - source: https://github.com/weaveworks/weave/releases/download/v1.6.0/cni-plugin
    - source_hash: sha256=60435d9a525ce457ace4a97e6ce4e357d0d01fe72e7a0273ca034f07970665d7
    - makedirs: True
    - mode: 755

/etc/cni/net.d/10-weave.conf:
  file.managed:
    - source: salt://weave/10-weave.conf
    - makedirs: True
    - mode: 644

weave-node:
  cmd.run:
    - name: weave launch
    - require:
      - service: docker
