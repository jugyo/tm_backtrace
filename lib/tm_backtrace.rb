class Exception
  alias_method :_backtrace, :backtrace
  def backtrace
    b = _backtrace
    return unless b
    b.map do |t|
      file, line, _ = t.split(':')
      " \e[90mtxmt://open/?url=file://\e[32m" +
        File.expand_path(file) +
        "\e[90m&line=\e[0m#{line} \e[31m#{_}\e[0m"
    end
  end
end
