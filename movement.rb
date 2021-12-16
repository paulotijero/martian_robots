def movement(rectangular_world, robots)
  final_positions = []
  lost_trail = []
  
  robots.each do |robot|
    position = robot[:initial]

    robot[:movements].each do |movement|
      case movement
      when 'F'
        case position[:direction]
        when 'N'
          position[:y] = position[:y] + 1
        when 'E'
          position[:x] = position[:x] + 1
        when 'S'
          position[:y] = position[:y] - 1
        when 'W'
          position[:x] = position[:x] - 1
        else
          'ilegal direction'
        end
      when 'R'
        position = [1,2,'right']
      when 'L'
        position = [1,2,'left']
      else
        "ilegal movement"
      end
    end

    final_positions << position
  end

  final_positions
end