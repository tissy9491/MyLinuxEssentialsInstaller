#!/bin/bash 
disc="wget https://dl.discordapp.net/apps/linux/0.0.61/discord-0.0.61.deb && sudo dpkg -i discord-0.0.61.deb"
flatpak="flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo"
tg="flatpak install telegram"
balena="wget https://github.com/balena-io/etcher/releases/download/v1.19.22/balena-etcher_1.19.22_amd64.deb && sudo dpkg -i balena-etcher_1.19.22_amd64.deb"
opera="flatpak install flathub com.opera.Opera"
spoty="flatpak install flathub com.spotify.Client"
tw="wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb && sudo dpkg -i teamviewer_amd64.deb


cowsay -f tux "Tissy's Customization Script" | lolcat 

menu() {
    echo "1) Aggiorna repo e sistema"
    echo "2) Installa i pacchetti da Debian"
    echo "3) Installa i pacchetti esterni"
    echo "0) Esci dallo script"
    echo ""
}

do_command() {
    case $1 in
        1)
            sudo apt update && sudo apt full-upgrade
            ;;
        2)
            sudo apt install chromium neofetch inxi gimp gparted simple-scan git gpaste pluma virt-manager ghostwriter qbittorrent vlc vokoscreen-ng bleachbit zulucrypt-gui geany flatpak plasma-discover-backend-flatpak bash-completion && eval $flatpak
            ;;
        3)
            eval $disc && eval $tg && eval $balena && eval $opera && eval $spoty && eval $tw
            ;;
        0)
            exit
            ;;
        *)
            echo "Scelta non valida, riprova."
            echo ""
            ;;
    esac
}

ask_another_choice() {
    while true; do
        read -p "Vuoi fare un'altra scelta? (si/no): " answer
        echo ""
        case $answer in
            si)
                return 0
                echo ""
                ;;
            no)
                exit
                ;;
            *)
                echo "Risposta non valida, riprova."
                echo ""
                ;;
        esac
    done
}

while true; do
    menu
    read -p "Scegli un'opzione: " scelta
    echo ""
    do_command $scelta
    echo ""
    ask_another_choice
done
 

