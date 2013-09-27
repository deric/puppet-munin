# return the set of active interfaces as an array
require 'facter'
Facter.add("real_interfaces") do
  set_weight 50
  setcode do
    interfaces = Facter.value(:interfaces).split(/ |,/).reject do |i|
      i.match /eth\d+_\d+|sit0|virbr\d+_nic|vif\d+_\d+|veth\d+|__tmp\d+/ 
    end
    interfaces.join(',')
  end
end
