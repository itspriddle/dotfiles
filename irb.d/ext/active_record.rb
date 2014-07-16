module Kernel
  private

  if defined? ActiveRecord::Base
    # Private: Execute the given SQL query.
    #
    # query      - An SQL query
    # connection - An optional ActiveRecord connection, defaults to
    #              `ActiveRecord::Base.connection`
    #
    # Returns a result object (eg: PG::Result).
    def sql(query, connection = ActiveRecord::Base.connection)
      if query =~ /^select/
        connection.select_all query
      else
        connection.execute query
      end
    end

    # Private: Show ActiveRecord logs on STDOUT.
    #
    # Returns nothing.
    def show_log
      change_log STDOUT
    end

    # Private: Hides ActiveRecord logs.
    #
    # Returns nothing.
    def hide_log
      change_log nil
    end

    # Private: Changes the ActiveRecord logger to the given stream.
    #
    # stream - An IO stream or filename (e.g. `STDOUT`, `/tmp/file.log`)
    #
    # Returns nothing.
    def change_log(stream)
      ActiveRecord::Base.logger = Logger.new(stream)
      ActiveRecord::Base.clear_active_connections!
      nil
    end
  end
end
