require 'securerandom'

class Contact
    attr_accessor :phone, :name, :address

    def initialize(phone,name,address)
        if phone=~ /^\+?380\d{9}$/
            @phone = phone
            @name = name
            @address = address
        else 
            puts "Invalid phone"
        end
    end
end

class Contacts 
    def initialize
        @big_hash = {}
    end

    def add(contact)
        id = get_id
        if contact.name != nil
            @big_hash[id] = contact
            puts contact.name
            return id
        else
            @big_hash.delete(id)
        end

    end

    def list
        return @big_hash
    end

    def update(id, contact)
        return false unless @big_hash[id]
        @big_hash[id]= contact
        return true
    end

    def delete(id)
        return false unless @big_hash[id]
        @big_hash.delete(id)
        return true
    end

    def search_name(name)
        @big_hash.each do |id, value| 
            if value.name == name
                return value
            end
        end
        return 'nil'
    end

    def update_phone(id, phone)
        return false unless @big_hash[id]
        check_phone(phone)
        @big_hash[id].phone = phone
        return true
    end

    def sort
        contacts = []
        @big_hash.each do |id, value| 
            contacts.push(value.name) 
        end
        return contacts.sort
    end

    private

    def get_id
        id = SecureRandom.hex(10)
        return id
    end

    def check_phone(phone)
        if phone=~ /^\+?380\d{9}$/
            puts phone
        else 
            puts "Invalid"
        end
    end
end

book = Contacts.new
contact = Contact.new('+380957225501','Ars','Kyiv')
id1 = book.add(contact)
print "ID: ", id1 ,"\n"
contact=Contact.new('380313932','David','Sevastopol')
id2 = book.add(contact)
print "ID: ",id2,"\n"
contact = Contact.new('+380952224444','Somebody','Mumbai')
id3 = book.add(contact)
print "ID: ",id3,"\n"
puts "List: \n",book.list
puts "\n", "Update: "
contact=Contact.new('+380506661122','NotArs','NotKyiv')
puts book.update(id1, contact)
puts "Delete: \n",book.delete(id2)
puts "\nSearch by Name"
puts book.search_name('somebody')
puts "\n", "Update phone: "
puts book.update_phone(id1, '+380957225501')
print book.sort

