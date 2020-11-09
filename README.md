# dokku-discourse

Manage discourse on your dokku server. _Supports multiple discourse instances._

Each discourse app is a _standalone_ discourse instance. Each discourse container contains it's own redis & postgres installations and is not linked to other containers.

Caution, this is ALPHA software.

## Plugin installation

```sh
dokku plugin:install https://github.com/badsyntax/dokku-discourse.git discourse
```

## Commands

```sh
discourse:help           # Shows help
discourse:create <app>   # Creates a discourse app
discourse:destroy <app>  # Destroys a discourse app
discourse:list           # Lists discourse apps
```

## Usage

### Create a discourse app

```sh
dokku discourse:create discourse-app
```

You'll be prompted for various discourse configuration values, like SMTP details.

(You can supply the config values with the following create arguments: `<app_name> <hostname> <developer_emails> <smtp_address> <smtp_port> <smtp_username> <smtp_password>`.)

Data will be stored in the host directory `/var/lib/dokku/data/storage/APP_NAME`.

</details>

### Update your apps

TODO

### Add discourse plugins

TODO

## License

[MIT](./LICENSE.md)
