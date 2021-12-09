require 'securerandom'

class Contacts
    def initialize
        @big_hash = {}
        @small_hash = {}
    end

    def create(phone, name, address)
        id = SecureRandom.hex(10)
        @small_hash = {k_phone: phone, k_name: name, k_address: address}
        @big_hash[id] = @small_hash
        return id
    end

    def list
        return @big_hash
    end

    def update(id, phone, name, address)
        return false unless @big_hash[id]
        @big_hash[id]={k_phone: phone, k_name: name, k_address: address}
        return true
    end

    def delete(id)
        return false unless @big_hash[id]
        @big_hash.delete(id)
        return true
    end

    def search_id(id)
        return @big_hash[id]
    end

    def search_name(name)
        @big_hash.each do |id, contact| 
            if contact[:k_name] == name
                return contact
            end
        end
        return 'nil'
    end
end

Contact = Contacts.new
puts "Create: "
id1 = Contact.create('+380957225501', 'Ars', 'Kyiv')
id2 = Contact.create('+380957225502', 'NotArs', 'NotKyiv')
id3 = Contact.create('+380506972233', 'IdkWho', 'SameCity')
puts id1,id2,id3
puts "\nList: "
print Contact.list
puts "\nUpdate: "
puts Contact.update(id2, '+79781031932', 'David', 'Sevastopol')
puts "\nDelete: "
puts Contact.delete(id1)
puts "\nSearch by ID"
print "ID:",id2, "\n"
print Contact.search_id(id2)
puts "\nSearch by Name"
puts Contact.search_name('IdkWho')