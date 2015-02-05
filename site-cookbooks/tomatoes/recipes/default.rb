package "git"

directory node.app.web_dir do
	owner node.user.name
	mode "0755"
	recursive true
end

directory "#{node.app.web_dir}/public" do
	owner node.user.name
	mode "0755"
	recursive true
end

directory "#{node.app.web_dir}/logs" do
	owner node.user.name
	mode "0755"
	recursive true
end

template "#{node.nginx.dir}/sites-available/#{node.app.name}.conf" do
	source "nginx.conf.erb"
	mode "0644"
end

nginx_site "#{node.app.name}.conf"

cookbook_file "#{node.app.web_dir}/public/index.html" do
	source "index.html"
	mode "0755"
	owner node.user.name
end