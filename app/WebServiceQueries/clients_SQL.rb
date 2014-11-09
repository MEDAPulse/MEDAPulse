require 'pg'
  # Create the connection instance.

#  def connect
#    @conn = PG.connect(
#        :dbname => 'medapulse_dev',
#        :user => 'edenhalil',
#        :password => '')
  
  conn = PG::Connection.open(:dbname => 'medapulse_dev')

  if conn
    puts "Connected established."
  else
    puts "Connection failed."
  end
#  end

#  connect

  result = conn.send_query("SELECT * FROM clients;")
#    puts result[0], "\n"
  outp = "[{"

    conn.set_single_row_mode
    loop do
      res = conn.get_result or break
      res.check
      res.each do |row|
        # do something with the received row
        outp += '"name": "'+ row['first_name']+ '", ' # p is short for puts
#         puts row['first_name']
      end
    end

  outp += "}]"
  conn.finish

  puts outp