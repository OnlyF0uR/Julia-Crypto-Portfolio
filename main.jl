using SQLite, DataFrames, JSON3

println("Loading components...")

db = SQLite.DB("crypto.sqlite")

function parseCommand()
    args = split(readline(), " ")
    cmd = lowercase(popfirst!(args))

    return cmd, args
end

println("Welcome mate, time to watch the profit eh?")

while true
    print("Commands:\n - portfolio <name>\n - create <name>\n\n >> ")
    cmd, args = parseCommand()

    if cmd == "portfolio"
        if length(args) > 0
            poname = join(args, " ")

            #=
            size(df) (rows, columns)
            No data = (0, 2)
            One entry = (1, 2)
            =#
            df = DataFrame(DBInterface.execute(db, "SELECT transactions FROM portfolios WHERE name = ?", [poname]))

            if size(df, 1) == 0
                println("No portfolios were found.")
            else
                cnts = JSON3.read(string(df.transactions[1]))

                while true
                    print("Commands:\n - show\n - add\n - profit\n - setamount\n\n >> ")
                    cmd, args = parseCommand()

                    #=
                    Transactions:
                        {
                            { "name": "bitcoin",  "amount": 0.00001, "buy_price": 50000 },
                            { "name": "ethereum", "amount": 0.02,    "buy_price": 2000 }
                        }

                    We also have a prices table where we can lookup the last prices
                    =#
                    if cmd == "show"
                        # Fetch prices and calculate profit per transaction then merge transaction profits
                        # Log the data
                    elseif cmd == "add"
                        # Ask some questions
                        # Add the transaction
                    elseif cmd == "profit"
                        # Calculate and show alltime profit
                    else
                        println("Invalid command.")
                    end
                end
            end
        else
            println("You must enter a portfolio name.") 
        end
    elseif cmd == "create"
        # TODO: Got to add this as well
    else
        println("Invalid command.")
    end
end