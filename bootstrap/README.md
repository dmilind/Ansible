## Ansible : Base Packages
#### Abstract :

This repo is responsible for development and release of ansible base modules. These modules are responsible for bootstrapping the newly spun hosts. Basic non application related provisioning is done through this modules. `bootstrapper.yaml` which is main yml file is the triggering point for the deployment.

#### Testing :
 Once ansible module/component is developed on your branch, testing can be done against your test env.

###### Steps to test your Development :
* Provide ansible inventory to playbook as below.

```
     [all]
     hostname.domainname
```
* From bootstrapper.yml file, only uncomment out
individual role which you want to test. Rest of all please keep them commented.
To test all modules then do not comment out any role. Keep sequece as it is.
* Run ansible-playbook command as below.

```
ansible-playbook -i /path/to/inventory bootstrapper.yaml - u user -kK -v
```
* From stdout you can debug your playbook for specific role.

#### Release
A docker image will be release candidate with image name `bootstrap` image. `<registry.url>bootstrap:tag`. Base image used to build `bootstrap` image is `<registry>/ansible:2.4.2.0` where all dependencies are embedded in this image including specific ansible 2.4.2.0 and dnspython module.

#### Deployment
Currently this component will be deployed using docker method.Once docker image is provided provisioning can be done by executing docker run command.
```
docker run --rm -it -v /path/to/inventory:/etc/ansible/hosts <registry.url>bootstrap:< release-version > -k -K
```
