#!/bin/bash
#23.01.2023 - Guilherme Rosa
#UX/Desing & Help - Nelson Campos

P1=" X "
P2=" O "
stopGame=0

declare A{1,2,3}=" "
declare B{1,2,3}=" "
declare C{1,2,3}=" "

function board {
	echo -e "      1 : 2 : 3  "
	echo -e "                 "
	echo -e "  A ¨ $A1 | $A2 | $A3  "
	echo -e "  B ¨ $B1 | $B2 | $B3  "
	echo -e "  C ¨ $C1 | $C2 | $C3  "
}
echo " "
echo "to play insert <X or O>, <espace>, <position>, e.g:X A1"
board
echo " "

#player_input function will validate the player and positions inputed
#if valid, it will fill the game board

check_endgame () { 
	if [[ "${A1}" == "O" && "${A2}" == "O" && "${A3}" == "O" ]] ||
		[[ "${B1}" == "O" && "${B2}" == "O" && "${B3}" == "O" ]] ||
		[[ "${C1}" == "O" && "${C2}" == "O" && "${C3}" == "O" ]] ||
		[[ "${A1}" == "O" && "${B1}" == "O" && "${C1}" == "O" ]] ||
		[[ "${A2}" == "O" && "${B2}" == "O" && "${C2}" == "O" ]] ||
		[[ "${A3}" == "O" && "${B3}" == "O" && "${C3}" == "O" ]] ||
		[[ "${A1}" == "O" && "${B2}" == "O" && "${C3}" == "O" ]] ||
		[[ "${A3}" == "O" && "${B2}" == "O" && "${C1}" == "O" ]]; then
		echo " "
        echo "Congrats player O! YOU WON! :)"
        echo " "
        stopGame=1
		return
	else
		if  [[ "${A1}" == "X" && "${A2}" == "X" && "${A3}" == "X" ]] ||
			[[ "${B1}" == "X" && "${B2}" == "X" && "${B3}" == "X" ]] ||
			[[ "${C1}" == "X" && "${C2}" == "X" && "${C3}" == "X" ]] ||
			[[ "${A1}" == "X" && "${B1}" == "X" && "${C1}" == "X" ]] ||
			[[ "${A2}" == "X" && "${B2}" == "X" && "${C2}" == "X" ]] ||
			[[ "${A3}" == "X" && "${B3}" == "X" && "${C3}" == "X" ]] ||
			[[ "${A1}" == "X" && "${B2}" == "X" && "${C3}" == "X" ]] ||
			[[ "${A3}" == "X" && "${B2}" == "X" && "${C1}" == "X" ]]; then
			echo " "
            echo "Congrats player X! YOU WON! :)"
            echo " "
            stopGame=1
			return
		fi
	fi
}

player_input() {
    echo "What is your move?"
    read player position
        if [ "${player}" == "X" -o "${player}" == "O" ]; then
            if [ "${position}" == "A1" -o  "${position}" == "A2" -o  "${position}" == "A3" -o "${position}" == "B1" -o  "${position}" == "B2" -o  "${position}" == "B3" -o  "${position}" == "C1" -o  "${position}" == "C2" -o  "${position}" == "C3" ]; then 
                if [ "${position}" == "A1" ]; then
                    A1=${player}
                else
                    if [ "${position}" == "A2" ]; then
                        A2=${player}
                    else
                        if [ "${position}" == "A3" ]; then
                            A3=${player}
                        fi
                    fi
                
                    if [ "${position}" == "B1" ]; then
                        B1=${player}
                    else
                        if [ "${position}" == "B2" ]; then
                            B2=${player}
                        else
                            if [ "${position}" == "B3" ]; then
                                B3=${player}
                            fi
                        fi
                    fi

                    if [ "${position}" == "C1" ]; then
                        C1=${player}
                    else
                        if [ "${position}" == "C2" ]; then
                            C2=${player}
                        else
                            if [ "${position}" == "C3" ]; then
                                C3=${player}
                            fi
                        fi
                    fi
                fi
                echo "$(board)"
            else
                echo "invalid position"
                return
            fi       
        else
            echo "invalid player"
            return
        fi
check_endgame
}

while [ $stopGame -ne 1 ]; do
player_input
done