#!/usr/bin/env bash
 
# Лабинатор - скрипт для демонстрации лабораторных работ по Операционным системам.

SCRIPTNAME="Лабинатор"
VERSION="0.3"
LABA="4"
LABFOLDER="laba_$LABA-$(date '+%Y%m%d%H%M%S')"

clear
echo
echo "Добро пожаловать в скрипт '$SCRIPTNAME'."
echo "Цель скрипта - демонстарция лабораторных работ по операционным системам."
echo "Версия скрипта $VERSION, лабораторная работа № $LABA."
echo


echo "Создаём папку с именем $LABFOLDER для лабы..."
mkdir $LABFOLDER

# Задание 1
echo
cd $LABFOLDER
echo "Создаём каталоги cat1, cat2. В каталоге cat1 создаём файлы file1, file2, file3, relatives, friends, others, keywords, birthdays, list."
mkdir cat1 cat2
cd cat1
touch file1 file2 file3 relatives friends others keywords birthdays list
echo "В файл file1 передаем справку по команде grep. В file2 помещаем справку по команде find, в file3 помещаем справку по команде gzip."
echo "В файлы relatives, friends, others помещаем имена и номера телефонов знакомых, родственников и проч."
echo "В файл birthdays помещаем имена и даты рождения родственников, друзей и знакомых."
echo "В файл keywords помещаем слова и словосочетания: 'Unix, argument, symbolic link, command, question, option, one more'"
man grep > file1
man find > file2
man gzip > file3
echo "Ivan Ivanov: 093-000-22-22, 728-13-37" > relatives
echo "Pavel Noskov: 093-220-04-43, 711-31-93" > friends
echo "Leviy Tip: 090-300-11-22, 700-31-31" > others
echo "Ivan Ivanov: 01.01.1991" >> birthdays
echo "Pavel Noskov: 23.03.1993" >> birthdays
echo "Leviy Tip: 20.04.1995" >> birthdays
echo "Stason Pavlikov: 01.04.1991" >> birthdays
echo "Vitalka Kozlov: 32.03.1991" >> birthdays
echo "Unix" >> keywords
echo "argument" >> keywords
echo "symbolic link" >> keywords
echo "command" >> keywords
echo "question" >> keywords
echo "option" >> keywords
echo "one more" >> keywords

# Задание 2
echo
echo "Получаем список файлов каталога cat1, в которых присутствует слово name."
grep -lw "name" *

# Задание 3
echo
echo "Подсчитываем количество строк в файлах каталога cat1, в которых присутствует словосочетание 'to be'"
grep -r "to be" | wc -l

# Задание 4
echo
echo "Выдаём на экран все строки файлов каталога /etc, содержащие строки 'terminal', 'keyboard'"
echo "terminal qwdaqd" > /etc/test1
echo "keyboard ffsefsef" > /etc/test2
echo "keyboard terminal" > /etc/test3
grep -snw "terminal" /etc/* | grep -w "keyboard"
rm /etc/test1 /etc/test2 /etc/test3


# Задание 5
echo
echo "Выводим список файлов каталога /bin, имена которых начинаются с 'ch'"
ls /bin | grep "^ch.*"

# Задание 6
echo
echo "Помещаем в файл list список файлов каталога /etc, имена которых начинаются с букв a-m и содержит буквосочетание at"
ls /etc | grep "^[a-m]" | grep "at" > list
cat list

# Задание 7
echo
echo "Выводим на экран все строки файлов каталога cat1, в которых есть слова, состоящие только из больших букв(двух и более)"
grep -n "[A-Z]\{2,\}" *

# Задание 8
echo
echo "Выводим все строки, файлов каталога cat1, которые содержат 4 цифры подряд"
grep -n "[0-9]\{4,\}" *

# Задание 9
echo
echo "Выдаём на экран людей, которые роделись под знаком Овна(21 марта - 20 апреля)"
egrep -Hn "(2[1-9].03|3[0-1].03|0[1-9].04|1[0-9].04|20.04)" birthdays
#grep -n "[2-3][1-9].03" birthdays
#grep -n "[0-2][0-9].04" birthdays

# Задание 10
echo
echo "Подсчитываем сколько людей в файлах relatives, friends, others имеют два номера телефона"
grep -c "[0-9]\{3,}-[0-9]\{3,\}-[0-9]\{2,\}-[0-9]\{2,\}, [0-9]\{3,\}-[0-9]\{2,\}-[0-9]\{2,\}" relatives friends others

# Задание 11
echo
echo "Упаковываем gzip'ом файлы каталога cat1, содержащие номера телефонов формата "
gzip -rv $(grep -l "09[0-9]-[0-9]\{3,\}-[0-9]\{2,\}-[0-9]\{2,\}, 7[0-9]\{2,\}-[0-9]\{2,\}-[0-9]\{2,\}" *)
ls

# Задание 12
echo
echo "Копируем в каталог cat2 те файлы, в которых присутствуют слова и словосочетания, определенные в файле keywords"
cp $(grep -lf keywords *) ../cat2
ls ../cat2
