# The Code below will scrape what is in the dialog field of vm_name and then populate a text dialog field called vlan, we also mark it as read only
def dump_root()
  $evm.log(:info, "Begin $evm.root.attributes")
  $evm.root.attributes.sort.each { |k, v| $evm.log(:info, "\t Attribute: #{k} = #{v}")}
  $evm.log(:info, "End $evm.root.attributes")
  $evm.log(:info, "")
end
name = $evm.root['dialog_vm_name']
if name == 'test1'
  vlan = '21'
elsif name == 'test2'
  vlan= '22'
elsif name == 'test3'
  vlan= '23'
end
debug = true                   # enable/disable debug logging in evm.log

dump_root if debug
$evm.object['value'] = "#{vlan}"
$evm.object['read_only'] = true

$evm.log(:info, "$evm.root['dialog_name']: #{$evm.root['dialog_name'].inspect}")
