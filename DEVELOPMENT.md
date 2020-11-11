# How to develop this plugin

## Getting started

Clone the dokku repo:

```bash
git clone https://github.com/dokku/dokku
```

Move the discourse plugin repo into the root of the cloned dokku repo. The directory name must be `discourse`.

Change directory to the root of the dokku repo.

Start the dokku VM using vagrant:

```bash
vagrant up dokku
```

SSH into the dokku VM:

```bash
vagrant ssh

# or
ssh root@dokku.me
su - dokku
```

Link & enable the plugin:

```bash
cd /var/lib/dokku/plugins/available
ln -s /vagrant/discourse
dokku plugin:enable discourse
```

Now you can work on the plugin from your host machine and run the plugin in the dokku VM.

## Debugging

View logs:

```sh
dokku logs discourse-app
```
