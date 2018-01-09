# Defined in /var/folders/v_/qcvcpt9x3z115knlg2jpd0_xd_xldk/T//fish.tpuWJ1/aloita.fish @ line 2
function aloita
	cd /Users/teemukau/code/harja
    cd tietokanta
    time sh devdb_restart.sh
    and ..
    and time lein do clean, clean, clean
    and time lein compile
    and lein repl
end
