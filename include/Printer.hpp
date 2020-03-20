/*
** EPITECH PROJECT, 2020
** test
** File description:
** Printer
*/

#ifndef PRINTER_HPP_
#define PRINTER_HPP_

#include <string>
#include <iostream>

class Printer {
    public:
        Printer(const std::string& str) : _str(str) {}
        ~Printer() = default;

        void set(const std::string& str) { _str = str; };
        void print() { std::cout << _str << std::endl; };
        void add(const std::string& str, bool space) { if (space) _str += static_cast<std::string>(" ") += str;
                                                        else _str += str; }

    private:
        std::string _str;
};

#endif /* !PRINTER_HPP_ */
