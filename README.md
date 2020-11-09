# dokku-discourse

Manage discourse on your dokku server.

Each discourse app is a separate _standalone_ discourse instance.

## Plugin installation

```sh
dokku plugin:install https://github.com/badsyntax/dokku-discourse.git discourse
```

## Commands

```sh
discourse:help                            # Shows help
discourse:create <app>                    # Creates a discourse app
discourse:destroy <app>                   # Destroys a discourse app
discourse:list                            # Lists discourse apps
discourse:install-plugin <app> <git_url>  # Installs a plugin for a discourse app
```

## Usage

### Create a new discourse app

```sh
dokku discourse:create discourse-app
```

:warning:&nbsp; *A new docker image will be built and this process can take some time.*

You'll be prompted for various discourse configuration values.

Data will be stored in location `/var/lib/dokku/data/storage/APP_NAME`.

Once your app is built & deployed, you can treat it as any other dokku app. You should use the [dokku-letsencrypt](https://github.com/dokku/dokku-letsencrypt) plugin for adding TLS.

Continue with the offical [discourse install instructions](https://github.com/discourse/discourse/blob/master/docs/INSTALL-cloud.md#start-discourse) to complete the discourse installation, ignoring any TLS setup instructions.

### Create from backup

TODO

### Update your apps

TODO

### Add discourse plugins

Install the askimet plugin:

```bash
dokku discourse:install-plugin discourse-app https://github.com/discourse/discourse-akismet
```

:warning:&nbsp; *The running discourse app will be stopped, the docker image rebuilt and the app redeployed.*

## License

[MIT](./LICENSE.md)
