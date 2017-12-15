#!/bin/bash


touch date_my
while (true)
do
    date && date >> date_my
    sleep 60
done

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
