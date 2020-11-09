# How to develop this plugin

## Getting started

Move the plugin directory into the dokku repo at location `plugins/discourse`.

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

Link the plugin:

```bash
cd /var/lib/dokku/plugins/available
ln -s /vagrant/plugins/discourse
```

Enable the plugin:

```bash
dokku plugin:enable discourse
```

Now you can work on the plugin from your host machine and run the plugin in the dokku VM.

## Debugging

View logs:

```sh
dokku logs discourse-app
```
