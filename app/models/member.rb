class Member
  attr_reader :name, :role, :party, :district

  def initialize(attrs)
    @attrs = attrs
    @name = attrs[:name]
    @role = attrs[:role]
    @party = attrs[:party]
    @district = attrs[:district]
  end

  def self.find_by_state(filter)
    MemberService.find_by_state(filter).map do |member|
      new(member)
    end
  end

  private
    attr_reader :attrs
end
