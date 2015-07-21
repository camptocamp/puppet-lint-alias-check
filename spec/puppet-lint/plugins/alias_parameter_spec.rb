require 'spec_helper'

describe 'alias_parameter' do
  context 'when using the namevar' do
    let(:code) do
      <<-EOS
        package { 'foo':
          ensure => installed,
          name   => $foo::params::pkg,
        }
      EOS
    end

    it 'should not detect any problems' do
      expect(problems).to have(0).problems
    end
  end

  context 'when using an alias' do
    let(:code) do
      <<-EOS
        package { $foo::params::pkg:
          ensure => installed,
          alias  => 'foo',
        }
      EOS
    end

    it 'should not detect 1 problem' do
      expect(problems).to have(1).problems
    end

    it 'should create warnings' do
      expect(problems).to contain_warning('alias parameter used').on_line(3).in_column(11)
    end
  end
end
