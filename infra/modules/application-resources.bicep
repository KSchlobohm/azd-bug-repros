targetScope = 'resourceGroup'

param location string

param isProd bool

@description('The resource names for the resources to be created.')
param resourceNames object

/*
** SQL Database
*/
resource sqlServer 'Microsoft.Sql/servers@2021-11-01' existing = if (!isProd) {
  name: resourceNames.sqlServer
}

resource sqlDatabase 'Microsoft.Sql/servers/databases@2021-11-01' = if (!isProd) {
  name: 'mydatabase'
  parent: sqlServer
  location: location
  sku: {
    name: 'Basic'
    tier: 'Basic'
    capacity: 5
  }
  properties: {
    requestedBackupStorageRedundancy: 'Local'
    collation: 'SQL_Latin1_General_CP1_CI_AS'
  }
}
