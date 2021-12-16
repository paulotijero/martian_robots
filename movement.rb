def movement(rectangular_world, robots)
  final_positions = []
  traces_lost = []
  
  robots.each do |robot|
    position = robot[:initial]

    robot[:movements].each do |movement|
      case movement
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
      when 'F'
        case position[:direction]
        when 'N'
          if(rectangular_world[:y] < position[:y] + 1)
            traces_lost << position
            position[:is_lost] = true
            break;
          end
          position[:y] = position[:y] + 1
        when 'E'
          if(rectangular_world[:x] < position[:x] + 1)
            traces_lost << position
            position[:is_lost] = true
            break;
          end
          position[:x] = position[:x] + 1
        when 'S'
          if( 0 > position[:y] - 1)
            traces_lost << position
            position[:is_lost] = true
            break;
          end
          position[:y] = position[:y] - 1
        when 'W'
          if( 0 > position[:x] - 1)
            traces_lost << position
            position[:is_lost] = true
            break;
          end
          position[:x] = position[:x] - 1
        else
          'ilegal Forward'
        end
      else
        "ilegal movement"
      end
    end

    final_positions << position
  end

  final_positions
end