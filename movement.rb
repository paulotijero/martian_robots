def movement(rectangular_world, robots)
  final_positions = []
  lost_trace = []
  
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
            unless(lost_trace.include?(position))
              lost_trace << position.clone
              position[:is_lost] = true
              break;
            end
          end
          position[:y] = position[:y] + 1 unless(lost_trace.include?(position))
        when 'E'
          if(rectangular_world[:x] < position[:x] + 1)
            unless(lost_trace.include?(position))
              lost_trace << position.clone
              position[:is_lost] = true
              break;
            end
          end
          position[:x] = position[:x] + 1 unless(lost_trace.include?(position))
        when 'S'
          if( 0 > position[:y] - 1)
            unless(lost_trace.include?(position))
              lost_trace << position.clone
              position[:is_lost] = true
              break;
            end
          end
          position[:y] = position[:y] - 1 unless(lost_trace.include?(position))
        when 'W'
          if( 0 > position[:x] - 1)
            unless(lost_trace.include?(position))
              lost_trace << position.clone
              position[:is_lost] = true
              break;
            end
          end
          position[:x] = position[:x] - 1 unless(lost_trace.include?(position))
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

def decorate_output(rectangular_world, robots)
  output = movement(rectangular_world, robots)
  output_values = output.map{ |out| out.values }
  output_values.map{|val| p val.join(' ').gsub("true",'LOST')}
end