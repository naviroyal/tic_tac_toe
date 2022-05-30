class User
    attr_accessor :id,:name,:sign
    
    def initialize(id,name,sign)
        @id = id
        @name = name
        @sign = sign
    end
end