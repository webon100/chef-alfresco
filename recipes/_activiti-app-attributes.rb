edition = node['activiti-app']['edition']

node.default['activiti-app'][ edition ]['properties']['jdbc.username'] = node['alfresco']['properties']['db.username']
node.default['activiti-app'][ edition ]['properties']['jdbc.password'] = node['alfresco']['properties']['db.password']


node.default['artifacts']['activiticlasses']['unzip'] = false
node.default['artifacts']['activiticlasses']['filtering_mode'] = "append"
node.default['artifacts']['activiticlasses']['destination'] = "#{node['alfresco']['home']}/activiti"
node.default['artifacts']['activiticlasses']['destinationName'] = "lib"
node.default['artifacts']['activiticlasses']['owner'] = node['alfresco']['user']

node.default['artifacts']['activiti-ldap-conf']['unzip'] = false
node.default['artifacts']['activiti-ldap-conf']['filtering_mode'] = "append"
node.default['artifacts']['activiti-ldap-conf']['destination'] = "#{node['alfresco']['home']}/activiti"
node.default['artifacts']['activiti-ldap-conf']['destinationName'] = "lib"
node.default['artifacts']['activiti-ldap-conf']['owner'] = node['alfresco']['user']

#activiti app configuration

node.default['activiti-app']["community"]['groupId'] = "org.activiti"
node.default['activiti-app']["community"]['artifactId'] = "activiti-webapp-explorer2"
node.default['activiti-app']["community"]['version'] = "5.14"
node.default['activiti-app']["community"]['type'] = "war"
node.default['activiti-app']["community"]['owner'] = node['alfresco']['user']
node.default['activiti-app']["community"]['unzip'] = true

node.default['activiti-app']['enterprise']['groupId'] = "com.activiti"
node.default['activiti-app']['enterprise']['artifactId'] = "activiti-app"
node.default['activiti-app']['enterprise']['version'] = "1.5.0-SNAPSHOT"
node.default['activiti-app']['enterprise']['type'] = "war"
node.default['activiti-app']['enterprise']['owner'] = node['alfresco']['user']
node.default['activiti-app']['enterprise']['unzip'] = false



node.default['artifacts']['activiti-app']['groupId'] = node['activiti-app'][ edition ]['groupId']
node.default['artifacts']['activiti-app']['artifactId'] = node['activiti-app'][ edition ]['artifactId']
node.default['artifacts']['activiti-app']['version'] = node['activiti-app'][ edition ]['version']
node.default['artifacts']['activiti-app']['type'] = node['activiti-app'][ edition ]['type']
node.default['artifacts']['activiti-app']['owner'] = node['activiti-app'][ edition ]['owner']
node.default['artifacts']['activiti-app']['unzip'] = node['activiti-app'][ edition ]['unzip']


# activiti LDAP configuration
node.default['artifacts']['activiti-ldap']['groupId'] = "com.activiti"
node.default['artifacts']['activiti-ldap']['artifactId'] = "activiti-ldap"
node.default['artifacts']['activiti-ldap']['version'] = "5.20.0.0-SNAPSHOT"
node.default['artifacts']['activiti-ldap']['type'] = "war"
node.default['artifacts']['activiti-ldap']['owner'] = node['alfresco']['user']
node.default['artifacts']['activiti-ldap']['unzip'] = false

# activiti AMP configuration
node.default['artifacts']['activiti-amp']['groupId'] = "com.activiti"
node.default['artifacts']['activiti-amp']['artifactId'] = "alfresco-connector-repo"
node.default['artifacts']['activiti-amp']['version'] = "1.5.0-SNAPSHOT"
node.default['artifacts']['activiti-amp']['type'] = "amp"
node.default['artifacts']['activiti-amp']['owner'] = node['alfresco']['user']
node.default['artifacts']['activiti-amp']['unzip'] = false

# activiti AMP configuration
node.default['artifacts']['activiti-amp-share']['groupId'] = "com.activiti"
node.default['artifacts']['activiti-amp-share']['artifactId'] = "alfresco-connector-share"
node.default['artifacts']['activiti-amp-share']['version'] = "1.5.0-SNAPSHOT"
node.default['artifacts']['activiti-amp-share']['type'] = "amp"
node.default['artifacts']['activiti-amp-share']['owner'] = node['alfresco']['user']
node.default['artifacts']['activiti-amp-share']['unzip'] = false

# activiti AMP configuration
node.default['artifacts']['activiti-ldap-demo-config']['groupId'] = "com.activiti"
node.default['artifacts']['activiti-ldap-demo-config']['artifactId'] = "alfresco-ldap-demo-config"
node.default['artifacts']['activiti-ldap-demo-config']['version'] = "1.5.0-SNAPSHOT"
node.default['artifacts']['activiti-ldap-demo-config']['type'] = "amp"
node.default['artifacts']['activiti-ldap-demo-config']['owner'] = node['alfresco']['user']
node.default['artifacts']['activiti-ldap-demo-config']['unzip'] = false


# Activiti WAR destination
if node['tomcat']['run_base_instance']
  node.default['artifacts']['activiti-app']['destination'] = node['tomcat']['webapp_dir']
  node.default['artifacts']['activiti-ldap']['destination'] = node['tomcat']['webapp_dir']
else
  node.default['artifacts']['activiti-app']['destination'] = "#{node['alfresco']['home']}/activiti/webapps"
  node.default['artifacts']['activiti-ldap']['destination'] = "#{node['alfresco']['home']}/solr/webapps"
  node.default['artifacts']['activiti-amp']['destination'] = "#{node['alfresco']['home']}/amps"
  node.default['artifacts']['activiti-ldap-demo-config']['destination'] = "#{node['alfresco']['home']}/amps"
  node.default['artifacts']['activiti-amp-share']['destination'] = "#{node['alfresco']['home']}/amps_share"
end