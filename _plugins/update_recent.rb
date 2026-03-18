Jekyll::Hooks.register :site, :pre_render do |site|
  system('bash update_recent.sh')
end