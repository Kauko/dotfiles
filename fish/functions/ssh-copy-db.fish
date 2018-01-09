# Defined in - @ line 2
function ssh-copy-db
	ssh -L 7731:localhost:5432 harja-dbsingleton
end
