package aserto.tenant.scc.SourceCodeCtl.ListTemplates

default allowed = false

# global role
allowed {
  u = input.user
  not u.enabled != true

  some i
  data.roles.roles[u.attributes.roles[i]].perms["aserto.tenant.scc.SourceCodeCtl.ListTemplates"].allowed
}

# tenant context role
allowed {
  u = input.user
  not u.enabled != true

  t = input.resource["Aserto-Tenant-Id"]
  a = u.applications[t]

  some i
  data.roles.roles[a.roles[i]].perms["aserto.tenant.scc.SourceCodeCtl.ListTemplates"].allowed
}
