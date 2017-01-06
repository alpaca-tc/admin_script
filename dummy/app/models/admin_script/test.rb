module AdminScript
  class Test < Base
    self.description = <<~TEXT
      This is an apple.
    TEXT

    def perform
      true
    end
  end
end
