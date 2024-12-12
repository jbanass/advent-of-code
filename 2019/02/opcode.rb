class OpCode
  NOUN_STEP = 1.freeze
  VERB_STEP = 2.freeze
  POSITION_STEP = 3.freeze
  NEXT_INSTRUCTION_STEP = 4.freeze

  def self.calculate(instructions)
    ptr = 0
    while true
      cur_op = instructions[ptr]

      case cur_op
      when 1..2
        noun, verb, position = instructions[instructions[ptr + NOUN_STEP]], instructions[instructions[ptr + VERB_STEP]], instructions[ptr + POSITION_STEP]
        instructions[position] = (cur_op == 1 ? noun + verb : noun * verb)
        ptr += NEXT_INSTRUCTION_STEP
      when 99
        return instructions
      end
    end
  end

  def self.find_noun_and_verb_to_match(match)
    noun, verb = 0
    result = nil
    instructions = reset_instructions(noun, verb)

    while noun <= 99
      verb = 0
      instructions = reset_instructions(noun, verb)
      while verb <= 99
        result = calculate(instructions)[0]

        if result == match
          return noun, verb
        else
          verb += 1
          instructions = reset_instructions(noun, verb)
        end
      end
      noun += 1
    end
  end

  private

  def self.reset_instructions(noun, verb)
    ['oops-a-plaintext-secret']
  end
end
