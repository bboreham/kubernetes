weave:
  file.managed:
    - name: /usr/bin/weave
    - source: https://github.com/weaveworks/weave/releases/download/v1.6.0/weave
    - source_hash: sha256=8848d9e698dd6fd7f4b634a2570b43057cc3af2981f7aea118a886891b61a4f1
    - makedirs: True
    - mode: 744

weave-node:
  cmd.run:
    - name: weave launch
    - require:
      - service: docker

weave-cni:
  file.managed:
    - name: /opt/cni/bin/weave-net
    - source: https://github.com/weaveworks/weave/releases/download/untagged-c859136bfb4fd8d6491b/weave-net
    - source_hash: sha256=60435d9a525ce457ace4a97e6ce4e357d0d01fe72e7a0273ca034f07970665d7
    - makedirs: True
    - mode: 744
  file.managed:
    - name: /opt/cni/bin/weave-ipam
    - source: https://github.com/weaveworks/weave/releases/download/untagged-c859136bfb4fd8d6491b/weave-net
    - source_hash: sha256=60435d9a525ce457ace4a97e6ce4e357d0d01fe72e7a0273ca034f07970665d7
    - makedirs: True
    - mode: 744

weave-cni-config:
  file.managed:
    - name: /etc/cni/net.d/10-weave.conf
    - source: salt://weave/10-weave.conf
    - makedirs: True
    - mode: 644
    - template: jinja
