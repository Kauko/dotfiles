function lyhytfig
	cd /Users/teemukau/code/harja
	set TIMER 160
	echo "Nukutaan $TIMER s"
	set START 0
	for x in (seq (math $TIMER / 10))
		echo -n "$START "
		for y in (seq 10)
			echo -n "."
			sleep 1
		end
		set END (math $START + 10)
		echo -n " $END"
		set START $END
		echo ""
	end
	echo "Käynnistetään figwheel"
    	rlwrap lein figwheel
end
