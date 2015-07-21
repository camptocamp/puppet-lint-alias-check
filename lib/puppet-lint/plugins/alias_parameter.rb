PuppetLint.new_check(:alias_parameter) do
  def check
    resource_indexes.each do |r|
      r[:tokens].select do |t|
        if t.type == :NAME && t.value == 'alias' && \
            t.next_code_token && t.next_code_token.type == :FARROW
          notify :warning, {
            :message => "alias parameter used",
            :line    => t.line,
            :column  => t.column,
            :token   => t,
          }
        end
      end
    end
  end
end
