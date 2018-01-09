function haara
	git symbolic-ref --short HEAD | tr -d '\n' | pbcopy
end
