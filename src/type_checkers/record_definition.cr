module Mint
  class TypeChecker
    def check(node : Ast::RecordDefinition) : Checkable
      fields =
        node
          .fields
          .map { |field| {field.key.value, resolve(field).as(Checkable)} }
          .to_h

      mappings =
        node
          .fields
          .map { |field| {field.key.value, field.mapping.try(&.value)} }
          .to_h

      Record.new(node.name, fields, mappings)
    end
  end
end
