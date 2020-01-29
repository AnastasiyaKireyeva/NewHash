require '../new_hash/new_hash.rb'

describe "HewHash" do
  before { @hash = NewHash.new}

  describe "#[]=" do
    it "adds values" do
      @hash["one"] = 1
      expect(@hash["one"]).to eq 1
    end
  end

  describe "#[]" do
    it "returns values" do
      @hash["one"] = 1
      expect(@hash["one"]).to eq 1
    end
  end

  describe "#find_key" do
    it "returns hash with the certain key" do
      @hash["one"] = 1
      expect(@hash).to receive(:find_key).with("one").and_return(["one", 1])
      @hash.find_key("one")
    end
  end

  describe "#shift" do
    it "deletes and returns the first element" do
      @hash["one"] = 1
      expect(@hash.shift).to eq ["one", 1]
    end
  end

  describe "#each_pair" do
    it "passes the key-value pair as parameters" do
      @hash["one"] = 1
      expect(@hash.each_pair).to eq ["one is 1"]
    end
  end

  describe "#inspect" do
    it "returns array converted into string" do
      @hash["one"] = 1
      expect(@hash.inspect).to eq "[[\"one\", 1]]"
    end
  end

  describe "#length" do
    context "when hash is given" do
      it "returns hash length" do
        @hash["one"] = 1
        expect(@hash.length).to eq 1
      end
    end
    context "when hash is not given" do
      it "returns 0" do
        expect(@hash.length).to eq 0
      end
    end
  end

  describe "#empty?" do
    context "when hash is not empty" do
      it "returns false" do
        @hash["one"] = 1
        expect(@hash.empty?).to be false
      end
    end
    context "when hash is empty" do
      it "returns true" do
      expect(@hash.empty?).to be true
      end
    end
  end

  describe "#clear" do
    it "returns []" do
      @hash["one"] = 1
      expect(@hash.clear).to eq([])
    end
  end
  
  describe "#values" do
    it "returns values" do
      @hash["one"] = 1
      @hash["two"] = 2
      expect(@hash.values).to match_array [1,2]
    end
  end

  describe "#keys" do
    it "returns keys" do
      @hash["one"] = 1
      @hash["two"] = 2
      expect(@hash.keys).to match_array ["one", "two"]
    end
  end

  describe "#delete" do
    context 'when the key is given' do
      it "returns value" do
        @hash["one"] = 1
        expect(@hash).to receive(:delete).with("one").and_return(1)
        @hash.delete("one")
      end
    end
    context 'when the key is not given' do
      it "returns nil" do
        expect(@hash.delete("one")).to be nil
      end
    end
  end
   
    

  





    





end

 


