require './lib/tm_backtrace'

def a; raise 'error'; end
def b; a; end
def c; b; end
def d; c; end

d
