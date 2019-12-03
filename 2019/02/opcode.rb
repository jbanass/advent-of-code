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
    [1,noun,verb,3,1,1,2,3,1,3,4,3,1,5,0,3,2,6,1,19,1,19,10,23,2,13,23,27,1,5,27,31,2,6,31,35,1,6,35,39,2,39,9,43,1,5,43,47,1,13,47,51,1,10,51,55,2,55,10,59,2,10,59,63,1,9,63,67,2,67,13,71,1,71,6,75,2,6,75,79,1,5,79,83,2,83,9,87,1,6,87,91,2,91,6,95,1,95,6,99,2,99,13,103,1,6,103,107,1,2,107,111,1,111,9,0,99,2,14,0,0]
  end
end
