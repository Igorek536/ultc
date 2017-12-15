#!/usr/bin/env bash
 
# Лабинатор - скрипт для демонстрации лабораторных работ по Операционным системам.

SCRIPTNAME="Лабинатор"
VERSION="0.5"
LABA="5"
LABFOLDER="laba_$LABA-$(date '+%Y-%m-%d--%H-%M-%S')"

BLACK='\e[0;30m'    # Black
RED='\e[0;31m'      # Red
GREEN='\e[0;32m'    # Green
YELLOW='\e[0;33m'   # Yellow
BLUE='\e[0;34m'     # Blue
MAGENTA='\e[0;35m'  # Purple
CYAN='\e[0;36m'     # Cyan
WHITE='\e[0;37m'    # White



######################################################################
### Блок задач

# Задача 0 / Инициализация
init () {
    clear
    echo
    echo "Добро пожаловать в скрипт '$SCRIPTNAME'."
    echo "Цель скрипта - демонстарция лабораторных работ по операционным системам."
    echo "Версия скрипта $VERSION, лабораторная работа № $LABA."
    echo
    echo "Создаём папку с именем $LABFOLDER для лабы..."
    mkdir $LABFOLDER
}

tast1 () {
    echo
    echo "Создаем директорию my_scripts, в которой будут хранится исполняемые файлы..."
    mkdir $LABFOLDER/my_scripts
    echo
}

task2 () {
    LIST_WORDS=$(ls ~ |wc -l)
    LIST=$(ls ~)
    echo
    echo "Подсчитываем кол-во подкаталогов в домашнем каталоге..."
    echo -e "${RED}В ${GREEN}моем ${YELLOW}домашнем ${BLUE}каталоге ${RED}$LIST_WORDS ${GREEN}подкаталогов${CYAN}: ${BLUE}$LIST${WHITE}"
}

task3 () {
    echo
    echo "Запустить скрипт на выполнение с помощью команд интерпритации."
    echo "Скрипт уже на выполнении!"
}

task4 () {
    echo
    echo "Считываем с жкрана слово и выводим кол-во символов этого слова..."
    read WORD
    echo "$WORD" | awk '{print length}'
}

task5 () {
    echo
    echo "Делаем скрипт исполняемым файлом, запускаем его на выполнение..."
    echo "Скрипт уже исполняемый файл и он уже на выполнении."
}

task6 () {
    echo
    echo "Работаем с .bash_profile"
    cd ~
    cp .bash_profile .bash_profile_bak 2> /dev/null
    echo "PROMPT_COMMAND=\"date\"" > .bash_profile
    echo "set PATH=$PATH:/home/igorek536/Документы/Лабы/ОперационныеСистемы/Лаба5/$LABFOLDER/my_scripts" >> .bash_profile
    echo "HISTSIZE=50;" >> .bash_profile
    echo "PS1=\"\[\e[01;36m\]\u\[\e[01;35m\]@\[\e[01;34m\]\w:\[\e[0;31m\]\"" >> .bash_profile
    echo "chmod +x /home/igorek536/Документы/Лабы/ОперационныеСистемы/Лаба5/$LABFOLDER/my_scripts/*" >> .bash_profile
    cat .bash_profile
    read X
    mv .bash_profile bash_profile_old
    cp .bash_profile_bak .bash_profile 2> /dev/null
    cd /home/igorek536/Документы/Лабы/ОперационныеСистемы/Лаба5/$LABFOLDER
}

task7 () {
    echo
    echo "Работаем с .bashrc"
    cd ~
    cp .bashrc .bashrc_bak
    echo "find file/ -type f -mtime -1 -user $(whoami) -size +1 -exec cp -p {} \;" >> .bashrc
    cat .bashrc
    read X
    mv .bashrc bashrc_old
    cp .bashrc_bak .bashrc
    cd /home/igorek536/Документы/Лабы/ОперационныеСистемы/Лаба5/$LABFOLDER
}

task8 () {
    echo
    echo "Работаем с .bash_logout"
    cd ~
    cp .bash_logout .bash_logout_bak 2> /dev/null
    echo "echo \"Досвидания! Спасибо за работу!\"" > .bash_logout
    cat .bash_logout
    read X
    mv .bash_logout bash_logout_old
    cp .bash_logout_bak .bash_logout 2> /dev/null
    cd /home/igorek536/Документы/Лабы/ОперационныеСистемы/Лаба5/$LABFOLDER
}

######################################################################
### Блок вызова

# Для вызова конкретной задачи используем ./labinator5 (номер задачи)
# Для вызова всех задач, используем ./labinator5 all
if (( "$1" > 0 )) && (("$1" < 9)); then
    init; task$1
elif [ "$1" == "all" ]; then
    init; task1; task2; task3; task4; task5; task6; task7; task8;
fi
