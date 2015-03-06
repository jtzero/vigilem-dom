source 'https://rubygems.org'

gemspec

args = ARGV.map {|str| str.gsub(/^:source$/, 'source') }

if (args & (excep = ["--without", "source"]) != excep)
  group :source do
    if Dir.exists?("../vigilem-core")
      gem "vigilem-core",    :path => "../vigilem-core"
    else
      gem "vigilem-core",    :git => "https://github.com/jtzero/vigilem-core.git"
    end
    if Dir.exists?("../vigilem-support")
      gem "vigilem-support",    :path => "../vigilem-support"
    else
      gem "vigilem-support",    :git => "https://github.com/jtzero/vigilem-support.git"
    end
  end
end
