# How to develop this plugin

Create new directory in the dokku project, eg `plugins/discourse`

Start the dokku VM using vagrant:

```bash
vagrant up dokku
```

SSH into the dokku VM:

```bash
vagrant ssh

# or
ssh root@dokku.me
```

Symlink the plugin:

```bash
cd /var/lib/dokku/plugins/available
ln -s /vagrant/plugins/discourse
```

Enable the plugin:

```bash
dokku plugin:enable discourse
```

Now you can work on the plugin from your host machine and run the plugin in the dokku VM.

View logs:

```sh
dokku logs discourse-app
```
