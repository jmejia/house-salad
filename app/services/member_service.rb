class MemberService
  def initialize(filter = {})
    @filter = filter
    @conn = Faraday.new(url: "https://api.propublica.org")
  end

  def find_by_state
    # response = conn.get "/congress/v1/members/?chamber=house&state=CO"
    # response = conn.get "/congress/v1/members/house/CO/current.json"
    # conn.headers = {'x-api-key' => "#{ENV["CONGRESS_API_KEY"]}"}
    response =
      conn.get do |req|
        req.url '/congress/v1/members/house/CO/current.json'
        req.headers['x-api-key'] = "#{ENV["CONGRESS_API_KEY"]}"
      end
    JSON.parse(response.body, symbolize_names:true)[:members]
  end

  def self.find_by_state(filter)
    new(filter).find_by_state
  end

  private
    attr_reader :filter, :conn

    def filter
      {
        chamber: "house",
        state: "CO"
      }
    end
end
