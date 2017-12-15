#!/usr/bin/env bash

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

# Задание 1.
echo "Создаём папку с именем $LABFOLDER для лабы..."
mkdir $LABFOLDER
echo "Создаём папки dir1, dir2, dir3..."
mkdir $LABFOLDER/dir1 $LABFOLDER/dir2 $LABFOLDER/dir3

# Задание 2.
echo "Создаём файлы F1 и F2 в папке dir1..."
ls $LABFOLDER/dir1
touch $LABFOLDER/dir1/F1 $LABFOLDER/dir1/F2

# Задание 3.
echo "Пишем инфу о пользователях в файл F1..."
who > $LABFOLDER/dir1/F1
echo
cat $LABFOLDER/dir1/F2
echo "Пишем список файлов домашней папки в файл F2..."
ls ~ > $LABFOLDER/dir1/F2
echo
cat $LABFOLDER/dir1/F2

# Задание 4.
echo "Копируем F1 в dir2/ ..."
cp $LABFOLDER/dir1/F1 $LABFOLDER/dir2/F3
echo "Создаём жесткую ссылку на файл F2 в dir2/ - F2_hard..."
ln $LABFOLDER/dir1/F2 $LABFOLDER/dir2/F2_hard
echo "Создаём мягкую ссылку на файл F3 в dir2/ - F3_light..."
ln -s $LABFOLDER/dir2/F3 $LABFOLDER/dir2/F3_light
ls $LABFOLDER/dir2/
echo "Удаляем мягкую ссылку..."
rm $LABFOLDER/dir2/F3_light
echo "Переименовываем жесткую ссылку в F4..."
cp $LABFOLDER/dir2/F2_hard $LABFOLDER/dir2/F4
ls $LABFOLDER/dir2

# Задание 5.
echo "Создаем файл F5 в dir3/"
touch $LABFOLDER/dir3/F5
cat $LABFOLDER/dir1/F1 > $LABFOLDER/dir3/F5
cat $LABFOLDER/dir1/F2 >> $LABFOLDER/dir3/F5
echo "Теперь файл F5 содержит информацию файлов F1 и F2."

# Задание 6.
echo "Обновляем содержимое файла F2 расширенным содержанием домашней папки..."
echo > $LABFOLDER/dir1/F2
ls -a ~ > $LABFOLDER/dir1/F2
more $LABFOLDER/dir1/F2
less $LABFOLDER/dir1/F2

# Задание 7.
echo "Создаем файл F6 в dir3/ ..."
touch $LABFOLDER/dir3/F6
echo "Список содержимого домашней директории" > $LABFOLDER/dir3/F6

# Задание 8.
echo "Добавляем текущую дату к файлу F6..."
date >> $LABFOLDER/dir3/F6
echo "Добавляем содержимое файла F2 к файлу F6..."
cat $LABFOLDER/dir1/F2 >> $LABFOLDER/dir3/F6

# Задание 9.
echo "Создаём файл F7 в dir1/ ..."
touch $LABFOLDER/dir1/F7
echo "Добавляем к файлу F7 список файлов текущего каталога"
echo "Сначала пишем те файлы, что начинаются на F ..."
find $LABFOLDER/dir?/F* >> $LABFOLDER/dir1/F7
echo "Теперь пишем те файлы, что начинаются на H ..."
find $LABFOLDER/dir?/H* >> $LABFOLDER/dir1/F7
echo "Записи в файле F7:"
cat $LABFOLDER/dir1/F7
echo

# Задание 10.
echo "Копируем файлы, которые записанны в F7 в каталог dir4/ ..."
touch $LABFOLDER/myerr
echo "Перенаправляем вывод ошибок в файл myerr"
cp $(cat $LABFOLDER/dir1/F7) $LABFOLDER/dir4  2>> $LABFOLDER/myerr
echo "Повторяем операцию копирования несколько раз..."
cp $(cat $LABFOLDER/dir1/F7) $LABFOLDER/dir4  2>> $LABFOLDER/myerr
cp $(cat $LABFOLDER/dir1/F7) $LABFOLDER/dir4  2>> $LABFOLDER/myerr
cp $(cat $LABFOLDER/dir1/F7) $LABFOLDER/dir4  2>> $LABFOLDER/myerr
cp $(cat $LABFOLDER/dir1/F7) $LABFOLDER/dir4  2>> $LABFOLDER/myerr
echo "Список ошибок файла myerr:"
cat $LABFOLDER/myerr

# Задание 11.
echo "Пробуем вывести список файлов каталога dir4/ ..."
echo "Так как будет ошибка, из-за отсутвия каталога, подавляем вывод ошибок..."
ls $LABFOLDER/dir4 2> /dev/null

# Задание 12.
echo "Копируем файл F1 в файл F7 ..."
echo "Выводим содержание файла F1:"
cat $LABFOLDER/dir1/F1
cp $LABFOLDER/dir1/F1 $LABFOLDER/dir1/F7

# Задание 13.
echo "Удаляем директорию dir1/ при помощи команды rmdir ..."
rmdir $LABFOLDER/dir1
echo "Удаляем остальные директории рекурсивно..."
rm -rf $LABFOLDER/dir?
ls $LABFOLDER
