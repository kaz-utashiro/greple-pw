requires 'perl', '5.008001';

requires 'App::Greple';
requires 'Getopt::EX', 'v1.2.1';
requires 'Clipboard';

on 'test' => sub {
    requires 'Test::More', '0.98';
};

