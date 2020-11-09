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

*A new docker image will be built and this process can take some time.*

You'll be prompted for various discourse configuration values.

Data will be stored in location `/var/lib/dokku/data/storage/APP_NAME`.

Once your app is built & started, you can treat it as any other dokku app. For example, you can setup TLS with `dokku letsencrypt APP_NAME`.

### Create from backup

TODO

### Update your apps

TODO

### Add discourse plugins

Install the askimet plugin:

```bash
dokku discourse:install-plugin discourse-app https://github.com/discourse/discourse-akismet
```

*The running discourse app will be stopped, the docker image rebuilt and the app redeployed.*

## License

[MIT](./LICENSE.md)
