/*
** EPITECH PROJECT, 2020
** test
** File description:
** main
*/

#include <cstdint>

#include "Printer.hpp"

int32_t main()
{
    Printer printer("Bonjour");

    printer.print();

    printer.set("Salut");

    printer.print();

    printer.add("les copains !!", true);

    printer.print();
    return 0;
}