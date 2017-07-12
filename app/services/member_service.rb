class MemberService
  def initialize(filter = {})
    @filter = filter
    @conn = Faraday.new(url: "https://api.propublica.org")
  end

  def find_by_state
    response = conn.get "/congress/v1/members/house/#{state}/current.json"
    conn.headers = {'Key' => "#{ENV[CONGRESS_API_KEY]}"}
  end
end
