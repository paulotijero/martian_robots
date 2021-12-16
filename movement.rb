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
          'ilegal Forward'
        end
      when 'R'
        case position[:direction]
        when 'N'
          position[:direction] = 'E'
        when 'E'
          position[:direction] = 'S'
        when 'S'
          position[:direction] = 'W'
        when 'W'
          position[:direction] = 'N'
        else
          'ilegal direction'
        end
      when 'L'
        case position[:direction]
        when 'N'
          position[:direction] = 'W'
        when 'E'
          position[:direction] = 'N'
        when 'S'
          position[:direction] = 'E'
        when 'W'
          position[:direction] = 'S'
        else
          'ilegal direction'
        end
      else
        "ilegal movement"
      end
    end

    final_positions << position
  end

  final_positions
end