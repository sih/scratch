require "mongo"
include Mongo

class MongoBasic
  
  # Make a new connection
  def connect(host="localhost",port=27017, myDb="test")
    MongoClient.new(host,port).db(myDb)
  end  
  
  # Use a collection
  def collection(connection=nil?, name=nil)
    return nil if connection.nil?
    return nil if name.nil?
    
    return connection.collection(name)
  end
  
  
  # Create a new document in the collection
  # Return the id of the document
  def create(collection=nil, validDoc=nil)
    return nil if collection.nil?
    return nil if validDoc.nil?
    
    collection.insert(validDoc)
  end
  
  
  # Find (by id)
  def find(collection=nil, id=nil)
    return nil if collection.nil?
    return nil if id.nil?
    
    collection.find("_id" => id).to_a
  end
  
  
  # General find
  def find_all(collection=nil,options={})
    return nil if collection.nil?
    return nil if options.nil?

    # TODO
  end
  
  
end

mb = MongoBasic.new
connection= mb.connect
collection = mb.collection(connection,"scratch")
doc = {"name" => "sid"}
id = mb.create(collection,doc)
puts id
dbdoc = mb.find(collection,id)