#!/usr/bin/env bash
 
# Лабинатор - скрипт для демонстрации лабораторных работ по Операционным системам.

SCRIPTNAME="Лабинатор"
VERSION="0.4"
LABA="5"
LABFOLDER="laba_$LABA-$(date '+%Y-%m-%d--%H-%M-%S')"



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


# Задание 1  (Одна единственная задача =( )
task1 () {
    echo "Каждую минуту записываем дату в файл date_min"
    touch $LABFOLDER/date_min
    while (true); do
        date && date >> $LABFOLDER/date_min
        sleep 60
    done
}

# Задание 2
# Запускаем скрипт с задачей 1 (`./labinator5.sh 1` &) в фоновом режиме
# Пишем jobs
# Пишем fg %1
# Жмем ctrl + z
# Пишем bg %1
# Пишем kill %1

# Задание 3
# Снова запускаем скрипт в фоновом режиме
# Пишем:
# ps -eo pid,ppid,ni,euid,user,%cpu,%mem,vsz,rss,stat,cmd | grep "./labinator5.sh 1"

# Задание 4
# Запускаем команду top
# Сортируем процессы по использованию CPU (shift + P)
# Сортируем процессы по использованию памяти (shift + M)

# Задание 5
# (узнать размер оперативки, марку и частоту процессора, узнать pid, ppid, uid, gid, как был запущен процесс mc)
# - Пишем cat /proc/meminfo | grep "MemTotal"
# - Пишем cat /proc/cpuinfo | grep "model name"
# - Пишем mc
# - Пишем ps | grep mc
# - Пишем cat /proc/(те цифры, что выдались предыдущей командой)/status | grep "PPid"
# - Пишем cat /proc/(те цифры, что выдались предыдущей командой)/status | grep "Gid"
# - Пишем cat /proc/(те цифры, что выдались предыдущей командой)/status | grep "Uid"
# - Пишем cat /proc/19820/cmdline

# Задание 6
# Так, тут мы планируем запуск скрипта в какое-то время.
# Пишем: at 16:00
# Открылась консоль команды at
# Туда пишем то, что мы хотим сделать в 16:00, а именно ./labinator5.sh 1
# Жмем Enter, ctrl + d и всё. Наша задача создана.
# В 16:00 мы можем посмотреть нашу задачу командой ps -ax | grep "labinator5.sh"

######################################################################
### Блок вызова

# Для вызова конкретной задачи используем ./labinator5 (номер задачи)
# Для вызова всех задач, используем ./labinator5 all
if (( "$1" > 0 )) && (("$1" < 6)); then
    task$1
elif [ "$1" == "all" ]; then
    init; task1
fi
