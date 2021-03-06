use strict;
use warnings;

sub show_logo {
        my @logos = (q#
     ...     ...          ...     ...             ....                            s   
  .=*8888n.."%888:     .=*8888n.."%888:       .x~X88888Hx.                       :8   
 X    ?8888f '8888    X    ?8888f '8888      H8X 888888888h.    .d``            .88   
 88x. '8888X  8888>   88x. '8888X  8888>    8888:`*888888888:   @8Ne.   .u     :888ooo
'8888k 8888X  '"*8h. '8888k 8888X  '"*8h.   88888:        `%8   %8888:u@88N  -*8888888
 "8888 X888X .xH8     "8888 X888X .xH8    . `88888          ?>   `888I  888.   8888   
   `8" X888!:888X       `8" X888!:888X    `. ?888%           X    888I  888I   8888   
  =~`  X888 X888X      =~`  X888 X888X      ~*??.            >    888I  888I   8888   
   :h. X8*` !888X       :h. X8*` !888X     .x88888h.        <   uW888L  888'  .8888Lu=
  X888xX"   '8888..:   X888xX"   '8888..: :"""8888888x..  .x   '*88888Nu88P   ^%888*  
:~`888f     '*888*"  :~`888f     '*888*"  `    `*888888888"    ~ '88888F`       'Y"   
    ""        `"`        ""        `"`            ""***""         888 ^               
                                                                  *8E                 
                                                                  '8>                 
                                                                   "                
#, q#
 .-----------------. .-----------------. .----------------.  .----------------.  .----------------. 
 | .--------------. || .--------------. || .--------------. || .--------------. || .--------------. |
 | | ____  _____  | || | ____  _____  | || |     ____     | || |   ______     | || |  _________   | |
 | ||_   \|_   _| | || ||_   \|_   _| | || |   .'    `.   | || |  |_   __ \   | || | |  _   _  |  | |
 | |  |   \ | |   | || |  |   \ | |   | || |  /  .--.  \  | || |    | |__) |  | || | |_/ | | \_|  | |
 | |  | |\ \| |   | || |  | |\ \| |   | || |  | |    | |  | || |    |  ___/   | || |     | |      | |
 | | _| |_\   |_  | || | _| |_\   |_  | || |  \  `--'  /  | || |   _| |_      | || |    _| |_     | |
 | ||_____|\____| | || ||_____|\____| | || |   `.____.'   | || |  |_____|     | || |   |_____|    | |
 | |              | || |              | || |              | || |              | || |              | |
 | '--------------' || '--------------' || '--------------' || '--------------' || '--------------' |
  '----------------'  '----------------'  '----------------'  '----------------'  '----------------' 
#, q#
    _   ___   ______        __ 
   / | / / | / / __ \____  / /_
  /  |/ /  |/ / / / / __ \/ __/
 / /|  / /|  / /_/ / /_/ / /_  
/_/ |_/_/ |_/\____/ .___/\__/  
                 /_/           
#, q#
 ____  _____  ____  _____   ___             _    
|_   \|_   _||_   \|_   _|.'   `.          / |_  
  |   \ | |    |   \ | | /  .-.  \ _ .--. `| |-' 
  | |\ \| |    | |\ \| | | |   | |[ '/'`\ \| |   
 _| |_\   |_  _| |_\   |_\  `-'  / | \__/ || |,  
|_____|\____||_____|\____|`.___.'  | ;.__/ \__/  
                                  [__|           
#, q#
 ███▄    █  ███▄    █  ▒█████   ██▓███  ▄▄▄█████▓
 ██ ▀█   █  ██ ▀█   █ ▒██▒  ██▒▓██░  ██▒▓  ██▒ ▓▒
▓██  ▀█ ██▒▓██  ▀█ ██▒▒██░  ██▒▓██░ ██▓▒▒ ▓██░ ▒░
▓██▒  ▐▌██▒▓██▒  ▐▌██▒▒██   ██░▒██▄█▓▒ ▒░ ▓██▓ ░ 
▒██░   ▓██░▒██░   ▓██░░ ████▓▒░▒██▒ ░  ░  ▒██▒ ░ 
░ ▒░   ▒ ▒ ░ ▒░   ▒ ▒ ░ ▒░▒░▒░ ▒▓▒░ ░  ░  ▒ ░░   
░ ░░   ░ ▒░░ ░░   ░ ▒░  ░ ▒ ▒░ ░▒ ░         ░    
   ░   ░ ░    ░   ░ ░ ░ ░ ░ ▒  ░░         ░      
         ░          ░     ░ ░                    
#, q#
███▄▄▄▄   ███▄▄▄▄    ▄██████▄     ▄███████▄     ███     
███▀▀▀██▄ ███▀▀▀██▄ ███    ███   ███    ███ ▀█████████▄ 
███   ███ ███   ███ ███    ███   ███    ███    ▀███▀▀██ 
███   ███ ███   ███ ███    ███   ███    ███     ███   ▀ 
███   ███ ███   ███ ███    ███ ▀█████████▀      ███     
███   ███ ███   ███ ███    ███   ███            ███     
███   ███ ███   ███ ███    ███   ███            ███     
 ▀█   █▀   ▀█   █▀   ▀██████▀   ▄████▀         ▄████▀   
#, q!
     ##### #     ##       ##### #     ##      # ###                         
  ######  /#    #### / ######  /#    #### / /  /###                         
 /#   /  / ##    ###/ /#   /  / ##    ###/ /  /  ###                  #     
/    /  /  ##    # # /    /  /  ##    # # /  ##   ###                ##     
    /  /    ##   #       /  /    ##   #  /  ###    ###               ##     
   ## ##    ##   #      ## ##    ##   # ##   ##     ##    /###     ######## 
   ## ##     ##  #      ## ##     ##  # ##   ##     ##   / ###  / ########  
   ## ##     ##  #      ## ##     ##  # ##   ##     ##  /   ###/     ##     
   ## ##      ## #      ## ##      ## # ##   ##     ## ##    ##      ##     
   ## ##      ## #      ## ##      ## # ##   ##     ## ##    ##      ##     
   #  ##       ###      #  ##       ###  ##  ##     ## ##    ##      ##     
      /        ###         /        ###   ## #      /  ##    ##      ##     
  /##/          ##     /##/          ##    ###     /   ##    ##      ##     
 /  #####             /  #####              ######/    #######       ##     
/     ##             /     ##                 ###      ######         ##    
#                    #                                 ##                   
 ##                   ##                               ##                   
                                                       ##                   
                                                        ##                  
!, q#
 ____ ____ ____ ____ ____ 
||N |||N |||O |||p |||t ||
||__|||__|||__|||__|||__||
|/__\|/__\|/__\|/__\|/__\|
#, q#
 /$$   /$$ /$$   /$$  /$$$$$$              /$$    
| $$$ | $$| $$$ | $$ /$$__  $$            | $$    
| $$$$| $$| $$$$| $$| $$  \ $$  /$$$$$$  /$$$$$$  
| $$ $$ $$| $$ $$ $$| $$  | $$ /$$__  $$|_  $$_/  
| $$  $$$$| $$  $$$$| $$  | $$| $$  \ $$  | $$    
| $$\  $$$| $$\  $$$| $$  | $$| $$  | $$  | $$ /$$
| $$ \  $$| $$ \  $$|  $$$$$$/| $$$$$$$/  |  $$$$/
|__/  \__/|__/  \__/ \______/ | $$____/    \___/  
                              | $$                
                              | $$                
                              |__/                
#, q#
[40;37;1m█████████████████████████████[0m
[40;37;1m█████████████████████████████[0m
[40;37;1m████ ▄▄▄▄▄ █ ▄ ▄ █ ▄▄▄▄▄ ████[0m
[40;37;1m████ █   █ █ ▀▀▀██ █   █ ████[0m
[40;37;1m████ █▄▄▄█ █▀▀█▀▄█ █▄▄▄█ ████[0m
[40;37;1m████▄▄▄▄▄▄▄█▄▀ ▀ █▄▄▄▄▄▄▄████[0m
[40;37;1m████▄ ██ ▄▄▀█ ▀ ▀██ █ ▄  ████[0m
[40;37;1m████▄██ ▄▀▄▄▄█▀▄█▀ ▄ ▄▄▄▀████[0m
[40;37;1m█████▄█▄█▄▄▄ ▄██   ██▀▄▀▀████[0m
[40;37;1m████ ▄▄▄▄▄ █▀▄ ▀ ▄█▀██▄ █████[0m
[40;37;1m████ █   █ █▄▄▀ ▀█▄▄▄▄▀▀ ████[0m
[40;37;1m████ █▄▄▄█ █▀▄█▄█▀   ▄███████[0m
[40;37;1m████▄▄▄▄▄▄▄█▄███▄▄▄▄█▄██▄████[0m
[40;37;1m█████████████████████████████[0m
[40;37;1m█████████████████████████████[0m
#, q#
          _____                    _____                   _______                   _____                _____          
         /\    \                  /\    \                 /::\    \                 /\    \              /\    \         
        /::\____\                /::\____\               /::::\    \               /::\    \            /::\    \        
       /::::|   |               /::::|   |              /::::::\    \             /::::\    \           \:::\    \       
      /:::::|   |              /:::::|   |             /::::::::\    \           /::::::\    \           \:::\    \      
     /::::::|   |             /::::::|   |            /:::/~~\:::\    \         /:::/\:::\    \           \:::\    \     
    /:::/|::|   |            /:::/|::|   |           /:::/    \:::\    \       /:::/__\:::\    \           \:::\    \    
   /:::/ |::|   |           /:::/ |::|   |          /:::/    / \:::\    \     /::::\   \:::\    \          /::::\    \   
  /:::/  |::|   | _____    /:::/  |::|   | _____   /:::/____/   \:::\____\   /::::::\   \:::\    \        /::::::\    \  
 /:::/   |::|   |/\    \  /:::/   |::|   |/\    \ |:::|    |     |:::|    | /:::/\:::\   \:::\____\      /:::/\:::\    \ 
/:: /    |::|   /::\____\/:: /    |::|   /::\____\|:::|____|     |:::|    |/:::/  \:::\   \:::|    |    /:::/  \:::\____\
\::/    /|::|  /:::/    /\::/    /|::|  /:::/    / \:::\    \   /:::/    / \::/    \:::\  /:::|____|   /:::/    \::/    /
 \/____/ |::| /:::/    /  \/____/ |::| /:::/    /   \:::\    \ /:::/    /   \/_____/\:::\/:::/    /   /:::/    / \/____/ 
         |::|/:::/    /           |::|/:::/    /     \:::\    /:::/    /             \::::::/    /   /:::/    /          
         |::::::/    /            |::::::/    /       \:::\__/:::/    /               \::::/    /   /:::/    /           
         |:::::/    /             |:::::/    /         \::::::::/    /                 \::/____/    \::/    /            
         |::::/    /              |::::/    /           \::::::/    /                   ~~           \/____/             
         /:::/    /               /:::/    /             \::::/    /                                                     
        /:::/    /               /:::/    /               \::/____/                                                      
        \::/    /                \::/    /                 ~~                                                            
         \/____/                  \/____/                                                                                
#, q#
NNNNNNNN        NNNNNNNNNNNNNNNN        NNNNNNNN     OOOOOOOOO                                  tttt          
N:::::::N       N::::::NN:::::::N       N::::::N   OO:::::::::OO                             ttt:::t          
N::::::::N      N::::::NN::::::::N      N::::::N OO:::::::::::::OO                           t:::::t          
N:::::::::N     N::::::NN:::::::::N     N::::::NO:::::::OOO:::::::O                          t:::::t          
N::::::::::N    N::::::NN::::::::::N    N::::::NO::::::O   O::::::Oppppp   ppppppppp   ttttttt:::::ttttttt    
N:::::::::::N   N::::::NN:::::::::::N   N::::::NO:::::O     O:::::Op::::ppp:::::::::p  t:::::::::::::::::t    
N:::::::N::::N  N::::::NN:::::::N::::N  N::::::NO:::::O     O:::::Op:::::::::::::::::p t:::::::::::::::::t    
N::::::N N::::N N::::::NN::::::N N::::N N::::::NO:::::O     O:::::Opp::::::ppppp::::::ptttttt:::::::tttttt    
N::::::N  N::::N:::::::NN::::::N  N::::N:::::::NO:::::O     O:::::O p:::::p     p:::::p      t:::::t          
N::::::N   N:::::::::::NN::::::N   N:::::::::::NO:::::O     O:::::O p:::::p     p:::::p      t:::::t          
N::::::N    N::::::::::NN::::::N    N::::::::::NO:::::O     O:::::O p:::::p     p:::::p      t:::::t          
N::::::N     N:::::::::NN::::::N     N:::::::::NO::::::O   O::::::O p:::::p    p::::::p      t:::::t    tttttt
N::::::N      N::::::::NN::::::N      N::::::::NO:::::::OOO:::::::O p:::::ppppp:::::::p      t::::::tttt:::::t
N::::::N       N:::::::NN::::::N       N:::::::N OO:::::::::::::OO  p::::::::::::::::p       tt::::::::::::::t
N::::::N        N::::::NN::::::N        N::::::N   OO:::::::::OO    p::::::::::::::pp          tt:::::::::::tt
NNNNNNNN         NNNNNNNNNNNNNNN         NNNNNNN     OOOOOOOOO      p::::::pppppppp              ttttttttttt  
                                                                    p:::::p                                   
                                                                    p:::::p                                   
                                                                   p:::::::p                                  
                                                                   p:::::::p                                  
                                                                   p:::::::p                                  
                                                                   ppppppppp              
#, q#
01001110 01001110 01001111 01110000 01110100 
#,
q#
.---------------------------------.           
|  .---------------------------.  |           
|[]|                           |[]|           
|  |                           |  |           
|  |                           |  |           
|  |                           |  |           
|  |           NNOPT           |  |           
|  |                           |  |           
|  |                           |  |           
|  |                           |  |           
|  |                           |  |           
|  `---------------------------'  |           
|      __________________ _____   |           
|     |   ___            |     |  |           
|     |  |   |           |     |  |           
|     |  |   |           |     |  |           
|     |  |   |           |     |  |           
|     |  |___|           |     |  |           
\_____|__________________|_____|__|dp

(Logo based on https://www.asciiart.eu/computers/floppies)
#,
q#
 _______
< NNOPt >
 -------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
#
);

        my $logo = $logos[rand @logos];
        print color('BRIGHT_BLUE').$logo.color('reset')."\n";
}


1;
