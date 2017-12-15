#!/usr/bin/env bash

# METAL IS SACRED FLESH IS WEAK
# DEUS MACHINA AVE OMNISSIAH
 
# Либанатор - скрипт для демонстрации лабораторных работ
# по Операционным системам.

VERSION="0.1"
LABA="2"
LABFOLDER="laba_$LABA-$(date '+%Y%m%d%H%M%S')"

clear
echo
echo "Добро пожаловать в скрипт 'Лабинатор'."
echo "Цель скрипта - демонстарция лабораторных работ по операционным системам."
echo "Версия скрипта $VERSION, лабораторная работа № $LABA."
echo


echo "Создаём папку с именем $LABFOLDER для лабы..."
mkdir $LABFOLDER

# Задание 1
mkdir $LABFOLDER/dir1
echo "Создаём подкаталоги в dir1 - dir11 и dir12..."
mkdir $LABFOLDER/dir1/dir11 $LABFOLDER/dir1/dir12
echo "Создаём файлы в директориях..."
cd $LABFOLDER/dir1/dir11
touch file1 file2 file3 gg ggg dat1 dat2 dat ee eee
echo "Записываем произвольную информацию в файлы: file1, file2, file3, gg, ggg, dat1, dat2, dat, ee, eee ..."
date > file1
ls ~ > file2
ls -a / > file3
who > gg
dir > ggg
date '+%Y-%m-%d' > dat1
ls /etc > dat2
echo "Рандомная инфа" > dat
cat /etc/apt/sources.list > ee
cat /etc/os-release > eee
cd ../dir12
touch my my1 my2 pp pPpP abc 321 XyZy 1234Y Pm
echo "Записываем произвольную информацию в файлы: my, my1, pp, XyZy, Pm ..."
cat /etc/os-release > my
date > my1
ls ~ > pp
ls -a / > XyZy
who > Pm
cd ..

# Задание 2
echo "Создаем tar архив каталога dir11..."
tar cf arc1.tar --exclude='dir11/dat' --exclude='dir11/eee' dir11
find dir11 -type f -not -name 'dat' -not -name 'eee' -delete
tar -tf arc1.tar

# Задание 3
echo "Создаем директорию dir13. Созданный ранее архив будет распакован в эту директорию."
mkdir dir13
tar -xwf arc1.tar -C dir13

# Задание 4
echo "Извлекаем из архива файлы, с именами на букву g ..."
tar -xf arc1.tar --wildcards --no-anchored 'g*'

# Задание 5
echo "Выводим содержание архива arc1.tar"
tar -tf arc1.tar
echo "Удаляем файлы, которые заканчиваются на цифру из архива"
tar --delete -wf arc1.tar --wildcards dir11/*[0-9]
tar -tf arc1.tar

# Задание 6
echo "Создаём архив arc2.tar, в который мы помещаем файлы из dir1/ состоящие из 3-х символов..."
tar -cf arc2.tar $(find dir11 -type f -name '???')

# Задание 7
echo "Создаём архив arc3.tar.gz в который помещаем файлы из dir13/ в именах которых есть буква e ..."
tar -czf arc3.tar.gz $(find dir11 -type f -name '*e*')

# Задание 8
echo "Упаковываем все файлы каталога dir12 с помощью gzip..."
gzip -rv dir12

# Задание 9
echo "Распаковываем те архивы, имена которых состоят из 3-х букв..."
gzip -dv dir12/???.gz

# Задание 10
echo "Распаковываем файлы, начинающиеся с прописной буквы..."
ls dir12
gzip -dv dir12/[[:upper:]]*.gz
ls dir12

# Задание 11
echo "Распаковываем файлы, имена которых состоят из 2-х символов с помощью gunzip..."
gunzip dir12/??.gz
ls dir12
