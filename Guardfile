guard :minitest, cli: '-p' do
  # with Minitest::Spec
  watch(%r{^spec/(.*)_spec\.rb})
  watch(%r{^lib/(.+)\.rb})         { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^spec/helper\.rb})      { 'spec' }
end
