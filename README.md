# dokku-discourse

Manage discourse on your dokku server. _Supports multiple discourse instances._

Caution, this is ALPHA software.

## Plugin installation

```sh
dokku plugin:install https://github.com/badsyntax/dokku-discourse.git discourse
```

## Commands

```sh
discourse:help           # Shows help
discourse:create <app> <hostname> <developer_emails> <smtp_address> <smtp_port> <smtp_username> <smtp_password>   # Creates a new discourse app
discourse:destroy <app>  # Destroys a discourse app
discourse:list           # Lists discourse apps
```

## Approach

Each discourse app is a _standalone_ discourse instance. Each discourse container contains it's own redis & postgres installations and is not linked to other containers.

## Usage

### Create a discourse app

```sh
dokku discourse:create app app.com email@example.com smpt.example.com 587 mailer@example.com password
```

<details><summary>Create operations</summary>

- Download and build the discourse image (this can take a lot of time but will be skipped if an image has been previously built)
- Create a dokku app with the correct docker options and configs
- Mount a host volume to store data and logs (at `/var/lib/dokku/data/storage/APP_NAME`)
- Tag the discourse image with the app name
- Deploy the discourse app

</details>

### Update your apps

TODO

### Add discourse plugins

TODO

## License

[MIT](./LICENSE.md)
