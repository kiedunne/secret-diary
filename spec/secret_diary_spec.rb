require 'secret_diary'

describe SecretDiary do
  it "Cannot add entry when first locked" do
    expect { subject.add_entry("New entry") }.to raise_error "Diary Locked"
  end

  it "Cannot access entries when first locked" do
    expect { subject.get_entries }.to raise_error "Diary Locked"
  end

  it "Can add entries if unlocked" do
    subject.unlock
    add_entry = subject.add_entry("New entry")
    expect(add_entry).to eq ["New entry"]
  end

  it "Can retrieve entries if unlocked" do
    subject.unlock
    subject.add_entry("New entry")
    get_entry = subject.get_entries
    expect(get_entry).to eq ["New entry"]
  end

  it "Cannot add entry when locked again" do
    subject.lock
    expect { subject.add_entry("New entry") }.to raise_error "Diary Locked"
  end

  it "Cannot retrieve entries when locked again" do
    subject.lock
    expect { subject.get_entries }.to raise_error "Diary Locked"
  end
  end
