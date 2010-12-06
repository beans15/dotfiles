if exists('g:loaded_django_helper')
  finish
endif

let g:loaded_django_helper = 1

function! django_helper#init()
  python <<EOF
import os
import sys
full_path = os.getcwd()
path = os.path.dirname(full_path)
project_name = os.path.basename(full_path)
sys.path.append(path)

prev_environ = os.environ['DJANGO_SETTINGS_MODULE']
os.environ['DJANGO_SETTINGS_MODULE'] = project_name + '.settings'

from django import db

os.environ['DJANGO_SETTINGS_MODULE'] = prev_environ
EOF
endfunction

command! DjangoInit :call django_helper#init()
