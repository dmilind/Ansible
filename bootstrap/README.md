## Ansible : Base Packages
#### Abstract :

This repo is responsible for development and release of ansible base modules. These modules are responsible for bootstrapping the newly spun hosts. Basic non application related provisioning is done through this modules. `bootstrapper.yml` which is main yml file is the triggering point for the deployment.


#### Best Practice to commit into this repo
`master` and `develop` branches are main branches. Make sure you are not committing your changes to `master` branch which has latest release code all the time. Only latest `release` branch will be allowed to merge to `master` branch.

###### Please follow below best practices for committing to this repo.

1. Create your own branch from `develop` branch.
2. All development will be on your own branch, once development is done, test you work from your branch only.
3. Once testing is done you can open a pull request to merge your commits only against `develop` branch by assigning reviewer in your PR.
4. In your pull request please attach the stdout of your ansible playbook deployment for more visibility to reviewer.

#### Development :
 For developing and testing each role or all ansible playbooks, we are using pure ansible structure. Local ansible config should be used is expected. These modules are common across all newly spun hosts. Host specific configurations is not a part of any role. We are following best practices where common params will be in `group_vars` while role specific params are under `default` dir. This makes easy to identify key value pair. All development is on own branch and tested module/code will be on `develop` branch.
 `NOTE: dnspython Python library is required while executing ansible playbooks on local machine.`

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
ansible-playbook -i /path/to/inventory bootstrapper.yml - u user -kK -v
```
* From stdout you can debug your playbook for specific role.

#### Release
`develop` branch is with all latest and tested code. Once development is done.
To release a candidate , a `release` branch can be cut from `develop`, this branch will be provided to QA for further testing. When QA gives go for this release, then CMB should be open to merge this code to `master`.
A docker image will be release candidate with image name `bootstrap` image. `art-hq.intranet.noname.com:5001/ansible/bootstrap:tag`. Base image used to build `bootstrap` image is `art-hq.intranet.noname.com:5001/ansible/ansible:2.4.2.0` where all dependencies are embedded in this image including specific ansible 2.4.2.0 and dnspython module.

#### Deployment
Currently this component will be deployed using docker method.Once docker image is provided provisioning can be done by executing docker run command.
```
docker run --rm -it -v /path/to/inventory:/etc/ansible/hosts art-hq.intranet.noname.com:5001/ansible/bootstrap:< release-version > -k -K
```
