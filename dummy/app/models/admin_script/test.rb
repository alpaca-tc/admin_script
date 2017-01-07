module AdminScript
  class Test < Base
    self.description = <<~TEXT
      This is an apple.
    TEXT

    type_attribute :id, :integer
    type_attribute :date, :date
    type_attribute :datetime, :datetime
    type_attribute :boolean, :boolean
    type_attribute :float, :float
    type_attribute :decimal, :decimal
    type_attribute :binary, :binary

    def perform
      false
    end

    def success_message
      '成功しました'
    end

    def failure_message
      '失敗しました'
    end
  end
end
