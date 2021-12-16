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

  describe "Ignore traces lost" do
    world = {x: 2, y: 2}

    it "Ignore the lost trace to the NORTH" do
      robots = [
        {
          initial: {x: 0, y: 2, direction: 'N'},
          movements: ['F','L','L','F']
        },
        {
          initial: {x: 0, y: 2, direction: 'N'},
          movements: ['F','L','L','F']
        }
      ]

      expect(movement(world, robots).last).to eq({x: 0, y: 1, direction: 'S'})
    end

    it "Ignore the lost trace to the EAST" do
      robots = [
        {
          initial: {x: 2, y: 0, direction: 'E'},
          movements: ['F','L','L','F']
        },
        {
          initial: {x: 2, y: 0, direction: 'E'},
          movements: ['F','L','L','F']
        }
      ]

      expect(movement(world, robots).last).to eq({x: 1, y: 0, direction: 'W'})
    end

    it "Ignore the lost trace to the SOUTH" do
      robots = [
        {
          initial: {x: 0, y: 0, direction: 'S'},
          movements: ['F','L','L','F']
        },
        {
          initial: {x: 0, y: 0, direction: 'S'},
          movements: ['F','L','L','F']
        }
      ]

      expect(movement(world, robots).last).to eq({x: 0, y: 1, direction: 'N'})
    end

    it "Ignore the lost trace to the WEST" do
      robots = [
        {
          initial: {x: 0, y: 0, direction: 'W'},
          movements: ['F','L','L','F']
        },
        {
          initial: {x: 0, y: 0, direction: 'W'},
          movements: ['F','L','L','F']
        }
      ]

      expect(movement(world, robots).last).to eq({x: 1, y: 0, direction: 'E'})
    end
  end

  describe "Criteria accepted" do

    it "First sample" do
      world = {x: 5, y: 3}
      robots = [
        {
          initial: {x: 1, y: 1, direction: 'E'},
          movements: ['R','F','R','F','R','F','R','F']
        },
        {
          initial: {x: 3, y: 2, direction: 'N'},
          movements: ['F','R','R','F','L','L','F','F','R','R','F','L','L']
        },
        {
          initial: {x: 0, y: 3, direction: 'W'},
          movements: ['L','L','F','F','F','L','F','L','F','L']
        }
      ]
  
      expect(movement(world, robots)).to eq([
        {x: 1, y: 1, direction: 'E'},
        {x: 3, y: 3, direction: 'N', is_lost: true},
        {x: 2, y: 3, direction: 'S'}
      ])
    end

  end

end

describe 'Decorate output' do

  it "First sample to criteria accepted" do
    world = {x: 5, y: 3}
    robots = [
      {
        initial: {x: 1, y: 1, direction: 'E'},
        movements: ['R','F','R','F','R','F','R','F']
      },
      {
        initial: {x: 3, y: 2, direction: 'N'},
        movements: ['F','R','R','F','L','L','F','F','R','R','F','L','L']
      },
      {
        initial: {x: 0, y: 3, direction: 'W'},
        movements: ['L','L','F','F','F','L','F','L','F','L']
      }
    ]

    expect(decorate_output(world, robots)).to eq(['1 1 E','3 3 N LOST','2 3 S'])
  end

  it "Sample test" do
    skip 'this is an example so you can use it in your tests.' do
      world = {x: 5, y: 3} # Dimensions of the planet 'Cartesian plane'
      # Ordered list of robots on the new planet with their starting points and movements.
      robots = [
        {
          initial: {x: 1, y: 1, direction: 'E'},
          movements: ['R','F','R','F','R','F','R','F']
        },
        {
          initial: {x: 3, y: 2, direction: 'N'},
          movements: ['F','R','R','F','L','L','F','F','R','R','F','L','L']
        },
        {
          initial: {x: 0, y: 3, direction: 'W'},
          movements: ['L','L','F','F','F','L','F','L','F','L']
        }
      ]
  
      # Expected output according to the definition of the exercise
      expect(decorate_output(world, robots)).to eq(['1 1 E','3 3 N LOST','2 3 S'])
    end
  end
  
end