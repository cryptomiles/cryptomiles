// Copyright (c) 2011-2014 The Bitcoin Core developers
// Copyright (c) 2017 The Cryptomiles Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef CRYPTOMILES_QT_CRYPTOMILESADDRESSVALIDATOR_H
#define CRYPTOMILES_QT_CRYPTOMILESADDRESSVALIDATOR_H

#include <QValidator>

/** Base58 entry widget validator, checks for valid characters and
 * removes some whitespace.
 */
class CryptomilesAddressEntryValidator : public QValidator
{
    Q_OBJECT

public:
    explicit CryptomilesAddressEntryValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

/** Cryptomiles address widget validator, checks for a valid cryptomiles address.
 */
class CryptomilesAddressCheckValidator : public QValidator
{
    Q_OBJECT

public:
    explicit CryptomilesAddressCheckValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

#endif // CRYPTOMILES_QT_CRYPTOMILESADDRESSVALIDATOR_H
