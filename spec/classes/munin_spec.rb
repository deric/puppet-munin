require 'spec_helper'

describe 'munin', :type => :class do

  it { should include_class('munin::host') }
  it { should include_class('munin::client') }
  it { should include_class('munin::plugin') }

end