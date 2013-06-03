require "spec_helper"

describe Players do 
  let(:players){Players.new}
  let(:my_names){["bob","joe","ralph"]}
  it "has array of names" do
    expect(players.names).to be_an_instance_of(Array)
  end

  describe "#shuffle" do
    it "randomizes the names" do
      my_names.each do |name|
        players.add_name(name)
      end
      players.shuffle
      expect(players.names).to_not eql(my_names)
    end
  end

  describe "#add_names" do
    it "sets names and checks" do
      my_name = my_names[1]
      players.add_name(my_name)
      players.each do |name|
        expect(name).to be_an_instance_of(String)
        expect(name).to eql(my_name)
      end
    end
  end

  describe "check_name" do
    context "if name is already inputted" do
       it "returns false" do
        my_name = my_names[1]
        players.add_name(my_name)

        expect(players.check_name(my_name)).to be_false
      end
    end
    context "if name is new" do
      it "checks if a name is already listed" do
        my_name = my_names[1]
        players.add_name(my_name)
        new_name = my_name[2]
        expect(players.check_name(new_name)).to be_true
      end
    end
  end

end