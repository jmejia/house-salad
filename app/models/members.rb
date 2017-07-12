class Member
  attr_reader :name, :role, :party, :district
  def initialize(attrs)
    @attrs = attrs
    @name = attrs[:name]
    @role = attrs[:role]
    @party = attrs[:party]
    @district = attrs[:distance]
  end
end
