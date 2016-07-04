# -*- coding: utf-8 -*-
"""
Take a screenshot and optionally upload it to your online server.

Display a 'SHOT' button in your i3bar allowing you to take a screenshot and
directly send (if wanted) the file to your online server.
When the screenshot has been taken, 'SHOT' is replaced by the file_name.

This modules uses the 'gnome-screenshot' program to take the screenshot.

Configuration parameters:
    - file_length: generated file_name length
    - push: True/False if yo want to push your screenshot to your server
    - save_path: Directory where to store your screenshots.
    - upload_path: the remote path where to push the screenshot
    - upload_server: your server address
    - upload_user: your ssh user

@author Amaury Brisou <py3status AT puzzledge.org>
"""
import time
import urllib2

class Py3status:
    """
    """
    # available configuration parameters
    cache_timeout = 60

    def __init__(self):
        self.full_text = ''

    def get_temp(self, i3s_output_list, i3s_config):
        body = ''
        temperature = -125
        color = i3s_config['color_bad']
        cache = time.time() + 5

        try:
            body = urllib2.urlopen("http://192.168.88.14/", timeout = 3).read()
            #body = urllib2.urlopen("http://192.168.10.179/", timeout = 3).read()
            temperature = float(body)
            cache = time.time() + self.cache_timeout
        except:
            body = "N/A"
        
        self.full_text = body + "℃"
        if temperature >= 24:
            color = i3s_config['color_good']
        elif temperature < 22:
            color = i3s_config['color_bad']
        else:
            color = i3s_config['color_degraded']

        response = {
            'cached_until': cache,
            'color': color,
            'full_text': self.full_text,
        }
        return response

if __name__ == "__main__":

    from time import sleep
    x = Py3status()
    config = {
        'color_bad': '#FF0000',
        'color_degraded': '#FFFF00',
        'color_good': '#00FF00',
    }
    while True:
        print(x.get_temp([], config))
        sleep(1)

