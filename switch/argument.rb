require 'csv'
class Argument 
    $parameters = Hash[:path => '', :source => '', :destination => '']

    def preprocess
        for arg in ARGV
           tag = extractCommand(arg)
           option = extractOption(arg)
           commandDictionary(tag,option)
        end
        $parameters
    end

    def commandDictionary(tag, option)
      case tag
      when /help/
          printHelp()
      when /file/
          filePath(option)
      when /source/
          source(option)
      when /destination/
          destination(option)
      end
    end
  

  private
 
  def extractCommand(command) 
    c = command.gsub("--","")
    return c.split("=")[0].downcase
  end

  def extractOption(command)
    return command.split("=")[1]
  end

  def printHelp() 
    $parameters[:help] = true
    $parameters
  end
  def filePath(option)
    $parameters[:path] = option
    $parameters
  end
  def source(option)
    $parameters[:source] = option
    $parameters
  end
  def destination(option)
    $parameters[:destination] = option
    $parameters
  end
end