require "byebug"

class Array
    def my_each(&blk)
        i = 0
        while i < self.length
            blk.call(self[i])
            i += 1
        end
        self
    end
    
    def my_select(&blk)
        new_arr = []
        self.my_each { |ele| new_arr << ele if blk.call(ele) }
        new_arr
    end
    
    def my_reject(&blk)
        new_arr = []
        i = 0
        while i < self.length
            new_arr << self[i] if !blk.call(self[i])
            i += 1
        end
        new_arr
    end

    def my_any?(&blk)
        self.my_each { |ele| return true if blk.call(ele) }
        false
    end

    def my_all?(&blk)
        self.my_each { |ele| return false if !blk.call(ele) }
        true
    end
    
    def my_flatten
        new_arr = []

        self.my_each do |ele| 
            if ele.kind_of?(Array)
                new_arr += ele.my_flatten 
            else
                new_arr << ele
            end
        end
        new_arr
    end

    def my_zip(*args)
        new_arr = []
        (0...self.length).each do |i|
            sub_arr = [self[i]]

            args.each do |arg| 
                sub_arr << arg[i]
            end
            new_arr << sub_arr
        end
        new_arr
    end

    def my_rotate(num=1)
        index = num % self.length
        
        self.drop(index) + self.take(index)
    end

    def my_join(separator="")
        str = ""
        self.length.times do |i|
            str += self[i]
            str += separator unless i == self.length-1
        end
        str
    end

    def my_reverse
        new_arr = []
        i = self.length - 1
        while i >= 0
            new_arr << self[i]
            i -= 1
        end
        new_arr
    end

    def 
end