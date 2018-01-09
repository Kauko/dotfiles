# Defined in - @ line 2
function ssh-prod-db
	ssh -L 7741:172.17.242.11:5432 harja-jenkins.solitaservices.fi
end
