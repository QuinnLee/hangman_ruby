require "spec_helper"

describe Players do 
  let(:players){Players.new}
  it "has array of names" do
    expect(players.names).to be_an_instance_of(Array)
  end

  describe "#shuffle" do
    it "randomizes the names" do
      my_names = ["bob","joe","ralph"]
      my_names.each do |name|
        players.add_names(name)
      end
      players.shuffle
      expect(players.names).to_not eql(my_names)
    end
  end

  describe "#add_names" do
    it "sets names and checks" do
      my_name = "Bob"
      players.add_names(my_name)
      players.each do |name|
        expect(name).to be_an_instance_of(String)
        expect(name).to eql(my_name)
      end
    end
  end

end