require_relative '../movement'

describe 'Movement' do

  describe "Forward tests" do
    world = {x: 5, y: 5}
    
    it "advance to position [0, 4, 'N']" do
      robots = [
        {
          initial: {x: 0, y: 0, direction: 'N'},
          movements: ['F','F','F','F']
        }
      ]
      
      expect(movement(world, robots)).to eq([{x: 0, y: 4, direction: "N"}])
    end

    it "advance to position [4, 0, 'E']" do
      robots = [
        {
          initial: {x: 0, y: 0, direction: 'E'},
          movements: ['F','F','F','F']
        }
      ]
      
      expect(movement(world, robots)).to eq([{x: 4, y: 0, direction: "E"}])
    end

    it "advance to position [5, 1, 'S']" do
      robots = [
        {
          initial: {x: 5, y: 5, direction: 'S'},
          movements: ['F','F','F','F']
        }
      ]
      
      expect(movement(world, robots)).to eq([{x: 5, y: 1, direction: "S"}])
    end

    it "advance to position [5 , 5, 'W']" do
      robots = [
        {
          initial: {x: 5, y: 5, direction: 'W'},
          movements: ['F','F','F','F']
        }
      ]
      
      expect(movement(world, robots)).to eq([{x: 1, y: 5, direction: "W"}])
    end

    it "return 2 final positions" do
      robots = [
        {
          initial: {x: 0, y: 0, direction: 'N'},
          movements: ['F','F','F','F']
        },
        {
          initial: {x: 0, y: 0, direction: 'E'},
          movements: ['F','F','F','F']
        },
      ]
      
      expect(movement(world, robots).count).to eq(2)
    end
    
  end

end