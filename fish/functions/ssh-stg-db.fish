# Defined in - @ line 2
function ssh-stg-db
	ssh -L 7721:172.17.240.11:5432 harja-jenkins.solitaservices.fi
end
