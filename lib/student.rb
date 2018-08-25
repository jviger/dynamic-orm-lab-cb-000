require_relative "../config/environment.rb"
require 'active_support/inflector'
require 'interactive_record.rb'

class Student < InteractiveRecord
  self.column_names.each do |col_name|
    attr_accessor col_name.to_sym
  end
  
  def find_by(column)
    column.each do |x,y|
      sql = "SELECT * FROM #{self.table_name} WHERE #{column[0]} = '#{column}'"
      DB[:conn].execute(sql)
    end
  end
  

end
