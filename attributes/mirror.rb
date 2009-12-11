apt Mash.new
apt[:mirror] = Mash.new
apt[:mirror][:base_path] = "/u/mirrors/apt"

apache Mash.new unless attribute?("apache")
apache[:sites] = Mash.new unless apache.has_key?("sites")
apache[:sites][:dist] = Mash.new
apache[:sites][:dist][:server_name] = "dist.#{domain}"
apache[:sites][:dist][:server_alias] = "dist"
apache[:sites][:dist][:document_root] = "/u/mirrors/dist"
apache[:sites][:dist][:error_log] = "/var/log/apache2/dist_error.log"

