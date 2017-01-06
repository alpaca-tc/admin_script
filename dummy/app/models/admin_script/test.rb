module AdminScript
  class Test < Base
    self.description = <<~TEXT
      This is an apple.
    TEXT

    def save
      true
    end
  end
end
