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

    it "go NORTH & get LOST" do
      robots = [
        {
          initial: {x: 0, y: 5, direction: 'N'},
          movements: ['F','L','L','F']
        }
      ]

      expect(movement(world, robots)).to eq([{x: 0, y: 5, direction: "N", is_lost: true}])
    end

    it "go EAST & get LOST" do
      robots = [
        {
          initial: {x: 5, y: 0, direction: 'E'},
          movements: ['F','L','L','F']
        }
      ]

      expect(movement(world, robots)).to eq([{x: 5, y: 0, direction: "E", is_lost: true}])
    end

    it "go SOUTH & get LOST" do
      robots = [
        {
          initial: {x: 0, y: 0, direction: 'S'},
          movements: ['F','L','L','F']
        }
      ]

      expect(movement(world, robots)).to eq([{x: 0, y: 0, direction: "S", is_lost: true}])
    end

    it "go WEST & get LOST" do
      robots = [
        {
          initial: {x: 0, y: 0, direction: 'W'},
          movements: ['F','L','L','F']
        }
      ]

      expect(movement(world, robots)).to eq([{x: 0, y: 0, direction: "W", is_lost: true}])
    end
  end

  describe "Turns RIGHT 90 degrees" do
    world = {x: 2, y: 2}
    
    it "From NORTH to EAST" do
      robots = [
        {
          initial: {x: 1, y: 1, direction: 'N'},
          movements: ["R"]
        }
      ]

      expect(movement(world, robots).first[:direction]).to eq('E')
    end

    it "From EAST to SOUTH" do
      robots = [
        {
          initial: {x: 1, y: 1, direction: 'E'},
          movements: ["R"]
        }
      ]

      expect(movement(world, robots).first[:direction]).to eq('S')
    end

    it "From SOUTH to WEST" do
      robots = [
        {
          initial: {x: 1, y: 1, direction: 'S'},
          movements: ["R"]
        }
      ]

      expect(movement(world, robots).first[:direction]).to eq('W')
    end

    it "From WEST to NORTH" do
      robots = [
        {
          initial: {x: 1, y: 1, direction: 'W'},
          movements: ["R"]
        }
      ]

      expect(movement(world, robots).first[:direction]).to eq('N')
    end

    it "From NORTH to SOUTH" do
      robots = [
        {
          initial: {x: 1, y: 1, direction: 'N'},
          movements: ["R","R"]
        }
      ]

      expect(movement(world, robots).first[:direction]).to eq('S')
    end
  end

  describe "Turns LEFT 90 degrees" do
    world = {x: 2, y: 2}
    
    it "From NORTH to WEST" do
      robots = [
        {
          initial: {x: 1, y: 1, direction: 'N'},
          movements: ["L"]
        }
      ]

      expect(movement(world, robots).first[:direction]).to eq('W')
    end

    it "From WEST to SOUTH" do
      robots = [
        {
          initial: {x: 1, y: 1, direction: 'W'},
          movements: ["L"]
        }
      ]

      expect(movement(world, robots).first[:direction]).to eq('S')
    end

    it "From SOUTH to EAST" do
      robots = [
        {
          initial: {x: 1, y: 1, direction: 'S'},
          movements: ["L"]
        }
      ]

      expect(movement(world, robots).first[:direction]).to eq('E')
    end

    it "From EAST to NORTH" do
      robots = [
        {
          initial: {x: 1, y: 1, direction: 'E'},
          movements: ["L"]
        }
      ]

      expect(movement(world, robots).first[:direction]).to eq('N')
    end

    it "From EAST to WEST" do
      robots = [
        {
          initial: {x: 1, y: 1, direction: 'E'},
          movements: ["L","L"]
        }
      ]

      expect(movement(world, robots).first[:direction]).to eq('W')
    end
  end

end