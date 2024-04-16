
@description('The overrides for the naming scheme.  Load this from the naming.overrides.jsonc file.')
param overrides object = {}

var defaultResourceNames = {
  sqlDatabase: 'relecloud-sqldb'
}

output resourceNames object = {
  sqlDatabase: contains(overrides, 'sqlDatabase') && !empty(overrides.sqlDatabase) ? overrides.sqlDatabase : defaultResourceNames.sqlDatabase
}
