#!/usr/bin/env bash

# METAL IS SACRED! FLESH IS WEAK!
# DEUS MACHINA! AVE OMNISSIAH!
#               - адептус механикус
 
# Либинатор - скрипт для демонстрации лабораторных работ по Операционным системам.

VERSION="0.3"
LABA="3"
LABFOLDER="laba_$LABA-$(date '+%Y%m%d%H%M%S')"
DEFAULTMASK="0002"

clear
echo
echo "Добро пожаловать в скрипт 'Лабинатор'."
echo "Цель скрипта - демонстарция лабораторных работ по операционным системам."
echo "Версия скрипта $VERSION, лабораторная работа № $LABA."
echo


echo "Создаём папку с именем $LABFOLDER для лабы..."
mkdir $LABFOLDER

# Задание 1
cd $LABFOLDER
echo "Создаём директорию test_dir и файл с именем test_file ..."
mkdir test_dir
touch test_file
echo "Права по умолчанию директории test_dir: $(stat -c '%a' test_dir), права по умолчанию файла test_file: $(stat -c '%a' test_file)"
echo "Первоначально установленные в системе права для файла: $((($(stat -c '%a' test_file) + $(umask))))"
echo "Первоначально установленные в системе права для директории: $((($(stat -c '%a' test_dir) + $(umask))))"
rm test_file
rmdir test_dir
echo

# Задание 2
echo "Задаем маску 0070. Эта маска позволит создавать файлы каталоги, доступные для всех операций только владельцу и сторонним пользователям."
umask 0070
touch test_f
mkdir test_d
stat -c '%a %n' *
rm test_f
rmdir test_d
echo "Возвращаем исходную маску $DEFAULTMASK"
umask $DEFAULTMASK
echo

# Задание 3
echo "Создаём каталоги dir1 и dir2. При этом dir1 - общедоступен."
mkdir dir1 dir2
chmod 777 dir1
stat -c '%a %n' *
echo

# Задание 4
echo "Создаём директорию dir2/dir21. dir2 - закрыта, dir21 - общедоступна"
mkdir dir2/dir21
chmod 777 dir2/dir21
stat -c '%a %n' dir2/dir21
chmod 000 dir2
stat -c '%a %n' dir2
echo

# Задание 5
echo "Создаём каталог dir1/dir11/dir111. dir111 - темный(в нём можно создавать файлы, но нельзя смотреть что в нём есть ещё)"
mkdir dir1/dir11
mkdir dir1/dir11/dir111
touch dir1/dir11/dir111/ttr
chmod a-r+x dir1/dir11/dir111
stat -c '%a %n' dir1/dir11/dir111
echo "Проверяем темный каталог"
ls dir1/dir11/dir111
echo

# Задание 6
echo "Создаём в dir1/dir11 файлы f1 и f2."
echo "f1: |u - все права|g - чтение, выполнение|o - ничего    |"
echo "f2: |u - чтение   |g - выполнение        |o - выполнение|"
touch dir1/dir11/f1 dir1/dir11/f2
chmod 750 dir1/dir11/f1
chmod 411 dir1/dir11/f2
ls -lh dir1/dir11/
echo

# Задание 7
FILELIST="a454 a\a \4a 44\? F4a41 f442 ??12 abcdf 1 4 a ? \b 44"
echo "Создаём в dir1 и dir2 файлы $FILELIST"
echo "Открываем для записи dir2"
chmod 700 dir2
stat -c '%a %n' dir2
cd dir1
touch $FILELIST
echo "Содержание dir1: $(ls)"
cd ../dir2
touch $FILELIST
echo "Содержание dir2: $(ls)"
cd ..
echo

# Задание 8
echo "Убираем право записи для всех категорий пользователей на все файлы каталога dir1/, имена которых содержат не менее трех символов..."
cd dir1
chmod a-w ???*
stat -c '%a %n' ???*
echo

# Задание 9
echo "Убираем все права доступа для сторонних пользователей на все файлы в dir1/, которые содержат цифры..."
chmod o-wrx *[0-9]*
stat -c '%a %n' *[0-9]*
echo

# Задание 10
echo "Добавляем право записи для владельца на все файлы dir1/ и dir2/, имена которых содержат не менее двух цифр и не заканчиваются на букву..."
echo "Работаем с dir1/"
chmod u+w *[0-9]*[0-9]*[!a-b!A-B]
stat -c '%a %n' *[0-9]*[0-9]*[!a-b!A-B]
cd ../dir2
echo "Работаем с dir2/"
chmod u+w *[0-9]*[0-9]*[!a-b!A-B]
stat -c '%a %n' *[0-9]*[0-9]*[!a-b!A-B]
echo

# Задание 11
echo "Добавляем право чтения для группы и сторонних пользователей на все те файлы каталогов dir1 и dir2, именя которых содержат символ '\'"
echo "Работаем с dir1/"
cd ../dir1
chmod go+r *\\*
stat -c '%a %n' *\\*
echo "Работаем с dir2/"
cd ../dir2
chmod go+r *\\*
stat -c '%a %n' *\\*
echo

# Задание 12
echo "Выводим древовидную структуру домашнего каталога..."
cd ../..
tree $LABFOLDER

# Задание 13
echo "Делаем домашний каталог закрытым..."
chmod a-rwx $LABFOLDER
stat -c '%a %n' $LABFOLDER
