text_hello	db	"Interpretator BrainFuck!", VARIABLE_ASCII_CODE_ENTER, VARIABLE_ASCII_CODE_NEWLINE, VARIABLE_ASCII_CODE_NEWLINE, 'Wersja: ', VARIABLE_PROGRAM_VERSION, VARIABLE_ASCII_CODE_ENTER, VARIABLE_ASCII_CODE_NEWLINE,' Uzycie: bfi <nazwa_pliku>', VARIABLE_ASCII_CODE_NEWLINE, VARIABLE_ASCII_CODE_TERMINATOR
text_missing_open_pair	db	"Blad: Nie znaleziono nawiasu '[' do pary", VARIABLE_ASCII_CODE_ENTER, VARIABLE_ASCII_CODE_NEWLINE, VARIABLE_ASCII_CODE_NEWLINE, VARIABLE_ASCII_CODE_TERMINATOR
text_missing_close_pair	db	"Blad: Nie znaleziono nawiasu ']' do pary", VARIABLE_ASCII_CODE_ENTER, VARIABLE_ASCII_CODE_NEWLINE, VARIABLE_ASCII_CODE_NEWLINE, VARIABLE_ASCII_CODE_TERMINATOR
