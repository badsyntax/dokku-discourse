# dokku-discourse

Manages discourse app instances on your dokku server.

## Plugin installation

```sh
dokku plugin:install https://github.com/badsyntax/dokku-discourse.git discourse
```

## Commands

```sh
discourse:help                            # Shows help
discourse:create <app>                    # Creates a discourse app
discourse:destroy <app>                   # Destroys a discourse app
discourse:upgrade <app>                   # Upgrades a discourse app
discourse:restore <app> <backup_file>     # Restores a backup for a discourse app
discourse:install-plugin <app> <git_url>  # Installs a plugin for a discourse app
discourse:list                            # Lists discourse apps
```

## Usage

### Create a new discourse app

Each discourse app is a separate _standalone_ discourse instance.

```sh
dokku discourse:create discourse-app
```

⚠️&nbsp; *A new docker image will be built and this process can take some time.*

You'll be prompted for various discourse configuration values.

Data will be stored in location `/var/lib/dokku/data/storage/APP_NAME`.

Once your app is built & deployed, you can treat it as any other dokku app. You should use the [dokku-letsencrypt](https://github.com/dokku/dokku-letsencrypt) plugin for adding TLS.

Continue with the offical [discourse install instructions](https://github.com/discourse/discourse/blob/master/docs/INSTALL-cloud.md#start-discourse) to complete the discourse installation, ignoring any TLS setup instructions.

### Upgrading a discourse app

The easiest way to upgrade is to use [the admin](http://discourse.dokku.me/admin/upgrade).

You can also upgrade a discourse app with the following:

```bash
dokku discourse:upgrade discourse-app
```

⚠️&nbsp; *The running discourse app will be stopped, the docker image rebuilt and the app redeployed.*

### Add discourse plugins

Install the askimet plugin:

```bash
dokku discourse:install-plugin discourse-app https://github.com/discourse/discourse-akismet
```

⚠️&nbsp; *The running discourse app will be stopped, the docker image rebuilt and the app redeployed.*

### Destroy an app

```bash
dokku discourse:destroy discourse-app
```

⚠️&nbsp; *Destroying an app does **not** remove the data directory.*

### Restore from backup

Discourse allows you restore a backup in [the admin](http://discourse.dokku.me/admin/backups) but this feature is limited by the nginx max body size. So you generally want to restore a backup using the cli.

You'll need a backup archive created by discourse, and a fresh discourse app. Follow the instructions above to create a new discourse app.

Now copy your backup archive to your server. *The file must be placed within the correct dokku data directory. Substitute APP_NAME with the name of the discourse app you just created.*

```bash
scp forum-backup.tar.gz root@dokku.me:/var/lib/dokku/data/storage/APP_NAME/backups/default/
```

Now you can restore the backup to the app you just created. The name must match the basename of the backup file.

```bash
dokku discourse:restore discourse-app forum-backup.tar.gz
```

## Development

See [DEVELOPMENT.md](./DEVELOPMENT.md).

## License

See [LICENSE.md](./LICENSE.md).
