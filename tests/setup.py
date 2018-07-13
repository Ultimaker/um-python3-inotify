#!/usr/bin/env python3
# -*- coding: utf-8 -*-
from distutils.core import setup
from distutils.command.build import build
import sys

class MyBuild(build):
    # ensure (at runtime) we are running python 3
    def __init__(self, *args, **kwargs):
        assert sys.version_info[0] == 3
        build.__init__(self, *args, **kwargs)

setup(
    name='py3_only_pkg',
    packages=['py3_only_pkg'],
    url='http://github.com/Ultimaker/python3-inotify/tests',
    cmdclass={'build':MyBuild},
    author='Embedded platform team',
    author_email='software-embedded-platform@ultimaker.com',
    description='Test python setup tools',
    )
