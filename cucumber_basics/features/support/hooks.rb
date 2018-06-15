Before do
  puts 'this is your before hook'
end

After do
  puts 'This is my after hook'
end

After("@username") do
  puts 'this is your after hook for username'
end
