package aserto.authorizer.directory.Directory.DeleteUserPermission

default allowed = false

# global role
allowed {
  u = input.user
  not u.enabled != true

  some i
  data.roles.roles[u.attributes.roles[i]].perms["aserto.authorizer.directory.Directory.DeleteUserPermission"].allowed
}
