class LogEntry

  class << self
    def random_log_entry(id)
      new(
        id: id,
        created_at: Time.now-(id*200),
        updated_at: Time.now-(id*200),
        source: "source-#{id}",
        destination: "destination-#{id}",
        status: "OK",
        status_code: 200,
        message: "A message #{id}"
      )
    end
  end

  attr_accessor :id, :created_at, :updated_at, :source, :destination, :status, :status_code, :message

  def initialize(attributes={})
    attributes.each do |k,v|
      self.send(:"#{k}=",v) if self.respond_to?(:"#{k}=")
    end
  end

  class << self
    def all
      @@all
    end
  end

  @@all = []
  100.times do |index|
    @@all << random_log_entry(index)
  end

end