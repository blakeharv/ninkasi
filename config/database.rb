if not defined? Neo
  require 'neo4j-core'
 
  neo4j_url = 'MY_NEO_SERVER'
   
  uri = URI.parse(neo4j_url)
   
  server_url = "http://#{uri.host}:#{uri.port}"
   
  Neo = Neo4j
  Neo::Session.open(:server_db, server_url, basic_auth: { username: uri.user, password: uri.password})

end