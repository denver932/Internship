class Contacts
    def initialize
        @big_array= []
    end

    def create(phone, name, address)
        @id = @big_array.size 
        add_arr(phone, name, address)
        return @id
    end

    def list
        return @big_array
    end

    def update(id,phone,name,address)
        return false unless @big_array[id]
        @big_array[id] = [phone, name, address]
        return true
    end

    def delete(id)
        return false unless @big_array[id]
        @big_array.delete_at(id)
        return true
        
    end

    def search_id(id)
        return @big_array[id]
    end

    def search_name(name)
        t=0
        @big_array.each_index do |x| 
            @big_array[x].each do|y|
                if y==name
                    t+=x+1  
                    break
                end        
            end 
        end  
        if t!=0
            print @big_array[t-1]
        else t==0 
            puts 'nil'
        end 
        
    end 

    private 

    def add_arr(phone, name, address)
        @arr = [phone, name, address]
        @big_array.insert(@id,@arr)
    end

end

Contact = Contacts.new 
puts "Create: "
c1 =  Contact.create('+380957225501', 'Ars', 'Kyiv')
c2 = Contact.create('+380957225502', 'NotArs', 'NotKyiv')
c3 = Contact.create('+380506972233', 'IdkWho', 'SameCity')
puts c1,c2,c3
puts "List: "
print(Contact.list,"\n")
puts "Update"
Contact.update(2, '+380508882435', 'IKnowWhiIt', 'Mumbai') 
puts "Delete"
Contact.delete(1)
print(Contact.list,"\n")
puts "Search by ID"
print Contact.search_id(0)
puts "\nSearch by Name"
Contact.search_name('IKnowWhiIt')

