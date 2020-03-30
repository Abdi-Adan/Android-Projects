from django.core.management.base import BaseCommand
import os


class Command(BaseCommand):
    help = 'renames a django project'

    def add_arguments(self, parser):
        parser.add_argument('new_project_name', type=str,
                            help='The new django project name')

    def handle(self, *args, **kwargs):
        new_project_name = kwargs['new_project_name']

        files_to_remane = ['demo/settings/base.py',
                           'demo/wsgi.py', 'manage.py']
        folder_to_rename = 'demo'

        for f in files_to_remane:
            with open(f, 'r') as file:
                filedata = file.read()

            filedata = filedata.replace('demo', new_project_name)
            with open(f, 'w') as file:
                file.write(filedata)
        os.rename(folder_to_rename, new_project_name)

        self.stdout.write(self.style.SUCCESS('Project has been renamed'))
