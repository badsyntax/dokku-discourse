#!/usr/bin/env bats

load test_helper

@test "should create a new discourse app" {
  echo "127.0.0.1 $HOSTNAME" | sudo tee -a /etc/hosts
  dokku discourse:create "$APP_NAME" "$HOSTNAME" "$DEVELOPER_EMAILS" "$SMTP_ADDRESS" "$SMTP_PORT" "$SMTP_USER_NAME" "$SMTP_PASSWORD"
  grep -qxF "$(dokku apps:list 2> /dev/null)" <<< "$APP_NAME"

  # Is discourse actually running?
  curl "$HOSTNAME" 2>&1 | grep -q "Discourse Setup"
}

@test "should list discourse apps" {
  grep -qxF "$(dokku discourse:list 2> /dev/null)" <<< "$APP_NAME"
  grep -qxF "$(dokku apps:list 2> /dev/null)" <<< "$APP_NAME"
}

@test "should install discourse plugins" {
  dokku discourse:install-plugin "$APP_NAME" https://github.com/discourse/discourse-akismet

  # check the plugin is installed in the running container
  dokku enter "$APP_NAME" web test -d /var/www/discourse/plugins/discourse-akismet
}

@test "should destroy a discourse app" {
  dokku discourse:destroy "$APP_NAME" --force
  ! grep -qxF "$(dokku apps:list 2> /dev/null)" <<< "$APP_NAME"
  ! grep -qxF "$(dokku discourse:list 2> /dev/null)" <<< "$APP_NAME"
  test -d "/var/lib/dokku/data/storage/$APP_NAME" # data dir unchanged
}

@test "should uninstall" {
  dokku plugin:uninstall discourse
  test -d "/var/lib/dokku/data/storage/$APP_NAME" # data dir unchanged
}
