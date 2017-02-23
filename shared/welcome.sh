# Custom Log in screen

login_pwd=`pwd`;
login_date=`date`;
#login_users=`users`;
#login_uptime=`uptime`;
#server_ip=`ifconfig | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1}'`;
disk_available=$(df -h -k 2> /dev/null | awk '{sum += $4;} END {print sum;}');
disk_used=$(df -h -k 2> /dev/null | awk '{sum += $3;} END {print sum;}');
disk_size=$(df -h -k 2> /dev/null | awk '{sum += $2;} END {print sum;}');
disk_available_mb=$(echo "scale=2; $disk_available/(1024^2)" | bc)
disk_used_mb=$(echo "scale=2; $disk_used/(1024^2)" | bc)
disk_size_mb=$(echo "scale=2; $disk_size/(1024^2)" | bc)

open_red_escape="\033[31m"
open_blue_escape="\033[34m"
open_green_escape="\033[32m"
close_escape="\033[0m"

function kai() {
echo -e "${open_blue_escape}+----------------------------------------------------------------------"
echo -e "${open_blue_escape}| "
echo -e "${open_blue_escape}| ${open_green_escape}:==:~~=~~=~=~~~~:~~~,.,,....,,,:7,::,:I777777777  77 7777I7777I777777=~=~::~=~~~~~=================="
echo -e "${open_blue_escape}| ${open_green_escape}::~=:~~~~~====~~~~:~~...,,,,,,,,,7?:7I+:~I777       777~,~~.......,=77?~=~::~=~~~~~====~============"
echo -e "${open_blue_escape}| ${open_green_escape}::~~:~~~~~~==~=~:~:~~.,,,,,,,,::=:7=77~~::=77777  777,...............,..~~~:~=~~~~~================="
echo -e "${open_blue_escape}| ${open_green_escape}:,=~:~~~~~===~=~~~:=~,,,,,,,,,,,:~7777777I7777  77I,......................,~~=~~~~~================="
echo -e "${open_blue_escape}| ${open_green_escape},:=~:~=~~~===:=~~::~~,,,,,,:::+:,,,:::=I~:::77777,,.........................~=~~~~=================="
echo -e "${open_blue_escape}| ${open_green_escape},~=~:~~~~~===~=~~~~~~:,,,,77==77:,,,I7+77~:::=7:,,...........................:~~~~================+="
echo -e "${open_blue_escape}| ${open_green_escape},~=~:~~~~~===:=~~=~~=~,,,7777777+::::I777?:::~,,,.............................::~~=+================"
echo -e "${open_blue_escape}| ${open_green_escape},~=~:~~~~~===~=~~=~:~~,,,I77 77+7I:::,:7777=7,,,..,....,:......................:~~=+================"
echo -e "${open_blue_escape}| ${open_green_escape},==~:~~~~~=====~~=~:~~=,,7 7  7I7~::,,,+7777,.,,..,,..,~,.......................~~++================"
echo -e "${open_blue_escape}| ${open_green_escape},==~:~~~~~=====~~~~~=~7:=777  77+:~~7I+I777,,,,,..,,.,,~~:..,.....,..............==================="
echo -e "${open_blue_escape}| ${open_green_escape},==~,~=~~~~=====~~~~=~,~~~?77 77:~~~777I?7,,,,,...,,.,:==~.......................==================="
echo -e "${open_blue_escape}| ${open_green_escape}:==~:~=~:=====~=~~=~~~~::~I77777~~~=777 7I,,,.,,.,,,,,~~=~~......................=================+="
echo -e "${open_blue_escape}| ${open_green_escape}~==~:~=~:=====~=~~~~~=:,:,:~~7 77777 7 77,,.,....::,:,,~~=~~,....................==================="
echo -e "${open_blue_escape}| ${open_green_escape}~==:~~==~=======~~~~~~:=:,,,,77777777 77,,..,...,:~,::::~==~~,,.................:+================+="
echo -e "${open_blue_escape}| ${open_green_escape}~==~~~==~====+==~~~~~~~,7,,,,,,,,::777 7:,..,...::,,:~~~~===~~::::,,,...........===================="
echo -e "${open_blue_escape}| ${open_green_escape}===~~~==~=======~~~=~~~~=::=.,,,,,,:777=,,..,...:::::~~~====~==~:::,::,.........=================+=="
echo -e "${open_blue_escape}| ${open_green_escape}~==~~===~=======~~~~=~~7777:,,?+,.,:777:,,.....~~===~=~~======:=...,,~::,.......==+============++==="
echo -e "${open_blue_escape}| ${open_green_escape}:,:~~~==~====~==~~=~===~=77:,,,,,,,,777,,,.....==::,..=========~~~~~~~~::.......==+======+=========="
echo -e "${open_blue_escape}| ${open_green_escape}~~:~~~=~~=====~==~=:=~=~:+~,,?:,,,,,,,:,,,.....~~.=,..=====~=========~~::,......======+============+"
echo -e "${open_blue_escape}| ${open_green_escape}~~~~~==~======~====~===~=77~~77?,,,,,,:,,......~===========~~========~~::,.....,=++================+"
echo -e "${open_blue_escape}| ${open_green_escape}~~~~===~=====+:==~=~~==~~7I~:::~:,:,777I......,===++++=======~=======~~::,.....==+=+=+============++"
echo -e "${open_blue_escape}| ${open_green_escape}~~~===~~======~====~~~~~=~+::,,?,.,=7777.......==+++++==:~~.,~~======~~::,,....=++====++====++====++"
echo -e "${open_blue_escape}| ${open_green_escape}~~~===~======~:=====:~:~~~~7777:,,,:?777+......===++++=~:~~=~~======~~~::,,....=+=+===++=====+=+==++"
echo -e "${open_blue_escape}| ${open_green_escape}~~~===~~======:=====~~~~=~?+=I=:::,,::,=:,.....~==+++++============~~~:::,,....=++++=+======+=====+="
echo -e "${open_blue_escape}| ${open_green_escape}~~~==~~~======~=~===~~~~~~~~=I7?,:,,:,,:,.......====++===========~~~~~:::,.....,+++=+=++=++==+======"
echo -e "${open_blue_escape}| ${open_green_escape}=~============~=~+==~=~~~~~=~?7+~:,,,,:,,.......========~:::,,::~~~~~:::,,....~=++++++===+======+++="
echo -e "${open_blue_escape}| ${open_green_escape}=====~========~=~===~~~=~~:~==+77?,,,,:::.......,=====~:~===~~~~~~~~::::,,....==++++================"
echo -e "${open_blue_escape}| ${open_green_escape}~=============~=~===~~=:?7?~:?777:::,,,,,.,.....,,======~~~~~~~~~~~::::,,,....==++=++==+======+++==="
echo -e "${open_blue_escape}| ${open_green_escape}=============~=~:,=:~~~:=777I=:777?I,,:~,,,.......:=========~==~~~::::::,,....=+++++=++=======++===="
echo -e "${open_blue_escape}| ${open_green_escape}~~==~========:==~~~~~~=:~777+~~?I?~,,,,:,,:,.,......~~~~======~~~:::::,,,,....==+++===========+++==="
echo -e "${open_blue_escape}| ${open_green_escape}=============:===,=:~~=~~7 77+=~:,,,,,,,:::,:.........=~~~==~~~~:::,,,,,,,,..,===++==========+=+++=="
echo -e "${open_blue_escape}| ${open_green_escape}=============~=~=:=,~~=~~77 77I:,,,,,,,,::::::..,:.....:~:~~~:::,::,,,,,,,,======+========+==++==++="
echo -e "${open_blue_escape}| ${open_green_escape}=================:=:~==~~77777+,,,,,,:::,:,::::~++:....,~~::::::::::::,,,~~~===+=+=~======+==+==++++"
echo -e "${open_blue_escape}| ${open_green_escape}=====~~==========:=,:=~~~?7I7777=~?=:::,::::::::I++==+?I:~~~~~~::::::~+========+++===+===++=====+==+"
echo -e "${open_blue_escape}| ${open_green_escape}======~==========~=,~=~=~~::~77 ~~=~:,,,::::,~:?++=++??II=~~~~~~~::?+~~~:=+====++++======+======+==="
echo -e "${open_blue_escape}| ${open_green_escape}=============~=++~=:~=:~~+777777~77=~,,,:::,,:++==++++?????:::~~?++=~~~~~~::~===+++++===+++=+===++=="
echo -e "${open_blue_escape}| ${open_green_escape}===================:==:~:~7~7777 77=~:,::::,,:?+==+????????++?++====~~~=+===~===++++====++=+====++=="
echo -e "${open_blue_escape}| ${open_green_escape}================+==:==~=~~:77I::+77=~~,::::+~:?,,:?????+++++??+?+?++++++++++===+++++=====+++==+=+==+"
echo -e "${open_blue_escape}|"
echo -e "${open_blue_escape}+----------------------------------------------------------------------"
}

echo -e " "
kai
#echo -e "${open_blue_escape}| ${open_green_escape}Server IP: ${open_red_escape}"$server_ip
echo -e "${open_blue_escape}| ${open_green_escape}Date: ${open_red_escape}"$login_date
#echo -e "${open_blue_escape}| ${open_green_escape}Users: ${open_red_escape}"$login_users
echo -e "${open_blue_escape}| ${open_green_escape}Directory: ${open_red_escape}"$login_pwd
#echo -e "${open_blue_escape}| ${open_green_escape}Uptime: ${open_red_escape}"$login_uptime
echo -e "${open_blue_escape}+----------------------------------------------------------------------${open_green_escape}"
df -h  | column -c 6 | awk '{ printf "\033[22;34m| \033[22;32m%s\t%s\t\033[22;31m%s\t%s\t%s\n", $1, $6, $2, $3, $4,$5 }'

echo -e "${open_blue_escape}| ${open_green_escape}Total Disk Space: ${open_red_escape}${disk_size_mb} GB"
echo -e "${open_blue_escape}| ${open_green_escape}Total Free Space: ${open_red_escape}${disk_available_mb} GB"
echo -e "${open_blue_escape}| ${open_green_escape}Total Used Space: ${open_red_escape}${disk_used_mb} GB"
echo -e "${open_blue_escape}+----------------------------------------------------------------------"
echo -e "${close_escape}"
