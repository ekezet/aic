# Ansible in Container

This is a container for running Ansible playbooks if don't want to install it on your host. It includes git, curl and nano for basic editing.

[!["Buy Me A Coffee"](https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png)](https://www.buymeacoffee.com/ekezet)

## Installed extra modules

- amazon.aws
- azure.azcollection
- kubernetes.core
- community.docker

## If you want to just try it out

```docker
docker run -it --rm --network=host -v $PWD/playbooks:/home/ansible/playbooks frici/aic
```

## Running with compose

`docker-compose.yml`:

```yaml
version: "3.6"
services:
  winbox:
    image: frici/aic
    container_name: aic
    restart: on-failure
    network_mode: host
    volumes:
      - $PWD/playbooks:/home/ansible/playbooks
```

Copy and paste then `docker-compose up -d`

## Ansible Collections

```text
/home/ansible/.ansible/collections/ansible_collections

Collection
------------------
amazon.aws
azure.azcollection
community.docker
kubernetes.core

/home/ansible/.local/lib/python3.11/site-packages/ansible_collections

Collection
-----------------------------
amazon.aws
ansible.netcommon
ansible.posix
ansible.utils
ansible.windows
arista.eos
awx.awx
azure.azcollection
check_point.mgmt
chocolatey.chocolatey
cisco.aci
cisco.asa
cisco.dnac
cisco.intersight
cisco.ios
cisco.iosxr
cisco.ise
cisco.meraki
cisco.mso
cisco.nso
cisco.nxos
cisco.ucs
cloud.common
cloudscale_ch.cloud
community.aws
community.azure
community.ciscosmb
community.crypto
community.digitalocean
community.dns
community.docker
community.fortios
community.general
community.google
community.grafana
community.hashi_vault
community.hrobot
community.libvirt
community.mongodb
community.mysql
community.network
community.okd
community.postgresql
community.proxysql
community.rabbitmq
community.routeros
community.sap
community.sap_libs
community.skydive
community.sops
community.vmware
community.windows
community.zabbix
containers.podman
cyberark.conjur
cyberark.pas
dellemc.enterprise_sonic
dellemc.openmanage
dellemc.os10
dellemc.os6
dellemc.os9
f5networks.f5_modules
fortinet.fortimanager
fortinet.fortios
frr.frr
gluster.gluster
google.cloud
grafana.grafana
hetzner.hcloud
hpe.nimble
ibm.qradar
ibm.spectrum_virtualize
infinidat.infinibox
infoblox.nios_modules
inspur.ispim
inspur.sm
junipernetworks.junos
kubernetes.core
lowlydba.sqlserver
mellanox.onyx
netapp.aws
netapp.azure
netapp.cloudmanager
netapp.elementsw
netapp.ontap
netapp.storagegrid
netapp.um_info
netapp_eseries.santricity
netbox.netbox
ngine_io.cloudstack
ngine_io.exoscale
ngine_io.vultr
openstack.cloud
openvswitch.openvswitch
ovirt.ovirt
purestorage.flasharray
purestorage.flashblade
purestorage.fusion
sensu.sensu_go
splunk.es
t_systems_mms.icinga_director
theforeman.foreman
vmware.vmware_rest
vultr.cloud
vyos.vyos
wti.remote
```
