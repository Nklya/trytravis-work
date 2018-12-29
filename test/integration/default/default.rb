# Test role with InSpec https://www.inspec.io/docs/reference/resources/

# Attributes example
version = attribute('version', default: 'latest')

# Resources example
describe service('mailhog') do
  it { should be_enabled }
  it { should be_running }
end

describe port(8025) do
  it { should be_listening }
end

describe port(1025) do
  it { should be_listening }
end
