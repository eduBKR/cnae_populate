require 'net/http'
require 'net/https' # for ruby 1.8.7
require 'json'

module CNAEPopulate
  def self.cnaes
    http = Net::HTTP.new('raw.githubusercontent.com', 443); http.use_ssl = true
    JSON.parse http.get('/eduBKR/cnae_populate/master/cnaes.json').body
  end

  def self.populate
    cnaes.each do |cnae|
      Cnae.create(cnae)      
    end
  end
end

CNAEPopulate.populate
