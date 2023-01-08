require('core.keymaps')
require('core.plugins')
 
-- Check if packer has been configured
local required_set = true
packer_plugin_conf = vim.fn.stdpath 'config' .. '/plugin/packer_compiled.lua'
 
if vim.fn.empty(vim.fn.glob(packer_plugin_conf)) > 0 then
  required_set = false
end
 
if required_set then
  require('core.plugin_config')
else
  print '=================================='
  print '    Plugins are being installed'
  print '         Press [ENTER] and'
  print '    Wait until Packer completes,'
  print '       then close nvim and '
  print ' Installation process will go on !'
  print '=================================='
  return
end
