#! /usr/bin/env python3

from pprint import pprint

RussionSigns = dict({en:ru for en, ru in zip(r'`1234567890-=qwertyuiop[]asdfghjkl;\'zxcvbnm,./~!@#$%^&*()_+QWERTYUIOP{}ASDFGHJKL:"ZXCVBNM<>?\|', 
                                             r'ё1234567890-=йцукенгшщзхъфывапролджэячсмитьбю.Ё!"№;%:?*()_+ЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ,\/')})

class Sign:
    '''
    Класс знака - буквы в kbd.
    '''
    special_seqs = ['<return>', 'SPC']
    def __init__(self, sign):
        self.sign = str(sign)
        if self.sign in ['\\', '"']:
            self.sign = '\\' + self.sign
    def __repr__(self):
        return self.sign

    def get_en(self):
        return self.sign

    def get_ru(self):
        if self.sign not in Sign.special_seqs:
            return RussionSigns[self.sign]
        return self.sign

    def isSign(sign):
        if len(sign) == 1 or sign in Sign.special_seqs:
            return True
        return False

class ControlSign:
    '''
    Класс управляющего символа
    '''
    def __init__(self, sign):
        self.sign = str(sign)

    def __repr__(self):
        return self.sign

    def get(self):
        return self.sign

    def isControlSign(sign):
        if sign in ['C', 'M', 's', 'H']:
            return True
        return False

class Simple:
    '''
    Класс простого сочетания, типа:
    C-s, M-t
    '''
    def __init__(self, kbd):
        kbd = [k.replace('\n', '-') for k in kbd.replace('--', '-\n').split('-')]
        self.control_signs = [ControlSign(s) for s in kbd[:-1]]
        self.sign = Sign(kbd[-1])

    def __repr__(self):
        return '-'.join([ControlSign.get(s) for s in self.control_signs]) \
            + '-' + self.sign.get_en()

    def get_en(self):
        return '-'.join([ControlSign.get(s) for s in self.control_signs]) \
            + '-' + self.sign.get_en()

    def get_ru(self):
        return '-'.join([ControlSign.get(s) for s in self.control_signs]) \
            + '-' + self.sign.get_ru()

    def get_control_sign(self, k):
        return self.control_signs[k]

    def isSimple(kbd):
        if '-' in kbd and not Sign.isSign(kbd):
            return True
        return False

class Complex:
    '''
    Класс составного сочетания, типа:
    C-s t, M-t t r
    '''
    def __init__(self, kbd):
        kbd = [a for a in kbd.split(" ") if a]
        self.kbd = []
        for k in kbd:
            if Simple.isSimple(k):
                self.kbd.append(Simple(k))
            else:
                self.kbd.append(Sign(k))
    def __repr__(self):
        return ' '.join([k.get_en() for k in self.kbd])

    def get_en(self):
        return ' '.join([k.get_en() for k in self.kbd])

    def get_ru(self):
        return ' '.join([k.get_ru() for k in self.kbd])

################################################################################

class Hotkeys:
    '''
    Класс горячих клавиш.
    Открывает файл input_file и считывает оттуда сочетания.
    '''
    def __init__(self, input_file, output_file):
        import os
        import sys
        os.chdir(os.path.dirname(sys.argv[0]))
        self.input_file = input_file
        self.output_file = output_file
        self.upload()
        self.create_hotkeys()

    def upload(self):
        '''
        Подгрузить файл с hotkes
        '''
        self.hotkeys = list()
        self.keys = set()
        for line in open(self.input_file).readlines():
            line = line.strip('\n').split('##')
            if len(line) == 1:
                key, command, mode, comment = '', '', '', line[0]
            else:
                key, command, mode, comment = line
            self._append(*list(map(lambda a: a.strip(' '), (key, command, mode, comment))))

    def _append(self, key, command, mode, comment):
        '''
        Добавить сочетиние в список известных
        '''
        if not comment.strip() and not command.strip():
            return None
        for hotkey in self.hotkeys:
            if hotkey['key'] == key and \
               hotkey['mode'] == mode and \
               hotkey['key'] and \
               hotkey['mode'] and \
               command != 'Команда':
                print('Error:')
                print('   ', mode, key, command, comment)
        self.hotkeys.append(dict({'key':key.strip(), 'mode':mode.strip(), 'command':command.strip(), 'comment':comment.strip()}))

    def get_max_len(self, key):
        '''
        Вернуть Длину максимального слова в колонке(для выравнивания)
        '''
        return max(len(data[key]) for data in self.hotkeys)

    def write_docs(self):
        '''
        Переписывает файл input_file делая отступы
        '''
        key_len = self.get_max_len('key')
        command_len = self.get_max_len('command')
        mode_len = self.get_max_len('mode')
        input_file = open(self.input_file, 'w')
        for key in self.hotkeys:
            if key['command']:
                input_file.write('{key}{key_spc} ## '.format(key=key['key'], key_spc=' '*(key_len-len(key['key']))))
                input_file.write('{command}{command_spc} ## '.format(command=key['command'], command_spc=' '*(command_len-len(key['command']))))
                input_file.write('{mode}{mode_spc} ## '.format(mode=key['mode'], mode_spc=' '*(mode_len-len(key['mode']))))
                input_file.write('{comment}\n'.format(comment=key['comment']))
            else:
                input_file.write('\n\n  {comment}\n'.format(comment=key['comment']))
        input_file.close()

    def e_symbs(self, kbd):
        '''
        Экранировать символы, если нужно
        '''
        return kbd.replace('"', '\"')

    def write_config(self):
        control_sequences = dict({'C-j':'', 'C-i':'', 'C-k':'', 'C-l':'', 'C-m':'', 'C-q':'', 'C-[':''})
        control_sequences_counter = 256
        input_file = open(self.output_file, 'w')
        input_file.write(self.unset_hotkeys())
        input_file.write('\n')
        russion_output = ''
        for key in self.hotkeys:
            # for eng
            if key['command'] == 'Команда':
                output_string = ';; {key}   {mode}   {command}   {comment}\n'.format(**key)
                input_file.write(output_string)
            elif key['key']:
                output_string = ''
                if key['key'] in control_sequences and not control_sequences[key['key']]: # new Управляющая последовательность
                    new_kbd = '[\\?C-{counter}]'.format(counter=control_sequences_counter)
                    output_string = '(define-key input-decode-map "\\{kbd}" {new})\n'.format(kbd=key['key'], new=new_kbd)
                    control_sequences[key['key']] = new_kbd
                    control_sequences_counter += 1
                if key['mode']: # Есть ли мод
                    output_string += '(define-key {mode} '.format(mode=key['mode'])
                else:
                    output_string += '(global-set-key '
                if key['key'] in control_sequences:
                    output_string += control_sequences[key['key']] + ' '
                else:
                    output_string += '(kbd \"{key}\") '.format(key=key['key'])
                output_string += "'{command})".format(command=key['command'])
                output_string += '   ;; {comment}\n'.format(comment=key['comment'])
                input_file.write(output_string)
            # # for ru
            # if key['command'] == 'Команда': 
            #     output_string = ';; {key}   {mode}   {command}   {comment}\n'.format(**key)
            #     russion_output += output_string
            # elif key['key']:
            #     output_string = ''
            #     if key['mode']: # Есть ли мод
            #         output_string += '(define-key {mode} '.format(mode=key['mode'])
            #     else:
            #         output_string += '(global-set-key '
            #     output_string += '(kbd \"{key}\") '.format(key=Complex(key['key']).get_ru())
            #     output_string += "'{command})".format(command=key['command'])
            #     output_string += '   ;; {comment}\n'.format(comment=key['comment'])
            #     russion_output += output_string
        input_file.write('\n')
        input_file.write('(setq hotkeys-docs "')
        input_file.write(self.create_hotkeys_docs())
        input_file.write('")\n\n(provide \'fkm:hotkeys)\n')
        input_file.close()
        # print(russion_output)

    def unset_hotkeys(self):
        '''
        Разназначать занятые клавиши
        '''
        out = ''
        for a in r'''qwertyuiop[]\asdfghjkl;'zxcvbnm,./{}|:">?<`~1234567890-=!@#$%^&*()_+''':
            if a in ['"', '\\']:
                out += '(global-unset-key  (kbd "C-\\{0}"))\n'.format(a)
                out += '(global-unset-key  (kbd "M-\\{0}"))\n'.format(a)
                out += '(global-unset-key  (kbd "C-M-\\{0}"))\n'.format(a)
            elif a in ['m', '[']:
                out += '(global-unset-key  (kbd "M-{0}"))\n'.format(a)
            elif a in ['x']:
                out += '(global-unset-key  (kbd "C-{0}"))\n'.format(a)
            else:
                out += '(global-unset-key  (kbd "C-{0}"))\n'.format(a)
                out += '(global-unset-key  (kbd "M-{0}"))\n'.format(a)
                out += '(global-unset-key  (kbd "C-M-{0}"))\n'.format(a)
        for a in ["SPC",]:
            out += '(global-unset-key  (kbd "C-{0}"))\n'.format(a)
            out += '(global-unset-key  (kbd "M-{0}"))\n'.format(a)
        return out

    def create_hotkeys_docs(self):
        key_len = self.get_max_len('key')
        command_len = self.get_max_len('command')
        mode_len = self.get_max_len('mode')
        comment_len = self.get_max_len('comment')
        split_line = '_'*(key_len + command_len + mode_len + comment_len + 9) + '\n'
        hotkeys_docs = ''
        for key in self.hotkeys:
            if key['command']:
                hotkeys_docs += ' {key}{key_spc} | '.format(key=key['key'], key_spc=' '*(key_len-len(key['key'])))
                hotkeys_docs += '{command}{command_spc} | '.format(command=key['command'], command_spc=' '*(command_len-len(key['command'])))
                hotkeys_docs += '{mode}{mode_spc} | '.format(mode=key['mode'], mode_spc=' '*(mode_len-len(key['mode'])))
                hotkeys_docs += '{comment}\n'.format(comment=key['comment'])
            else:
                if hotkeys_docs:
                    hotkeys_docs += '_'*key_len + '__|' + '_'*command_len + '__|' + '_'*mode_len + '__|' + '_'*comment_len + '\n'
                    hotkeys_docs += '\n\n'
                hotkeys_docs += split_line
                hotkeys_docs += '\n   {comment}\n'.format(comment=key['comment'])
                hotkeys_docs += split_line
        hotkeys_docs += '_'*key_len + '__|' + '_'*command_len + '__|' + '_'*mode_len + '__|' + '_'*comment_len + '\n'
        return self.e_symbs(hotkeys_docs)

    def create_hotkeys(self):
        '''
        Создать файл Hotkes
        '''
        self.write_config()
        self.write_docs()

    def get_load_name():
        return 'hotkeys'

if __name__ == '__main__':
    import os
    import sys
    os.chdir(os.path.dirname(__file__))
    if len(sys.argv) >= 3:
        input_path = sys.argv[1]
        output_path = sys.argv[2]
        Hotkeys(input_path, output_path).create_hotkeys()
    else:
        raise ValueError("Too few arguments. Need [input_path], [output_path]")
