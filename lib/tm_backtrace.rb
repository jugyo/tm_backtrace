class Exception
  alias_method :_backtrace, :backtrace
  def backtrace
    b = _backtrace
    return unless b

    b.map do |t|
      file, line, message = t.split(':')
      file = File.expand_path(file).sub(File.expand_path('~'), '~')
      " \e[90mtxmt://open/?url=file://\e[34m#{ file }\e[90m&line=\e[0m#{ line } \e[31m#{ message }\e[0m"
    end
  end
end
