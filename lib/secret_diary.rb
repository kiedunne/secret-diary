class SecretDiary
attr_accessor :locked

  def initialize
    @entries = []
    @locked = true
  end

  def lock
    @locked = true
  end

  def unlock
    @locked = false
  end

  def add_entry(entry)
    fail "Diary Locked" if @locked == true
    @entries << entry
  end

  def get_entries
    fail "Diary Locked" if @locked == true
    return @entries
  end
end

try = SecretDiary.new
p try.unlock
p try.lock
