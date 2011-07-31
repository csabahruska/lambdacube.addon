bl_info = {
    "name"          : "LambdaCube Tool",
    "description"   : "Turns Blender into a LambdaCube editor",
    "author"        : "Csaba Hruska",
    "version"       : (0, 1),
    "blender"       : (2, 5, 8),
    "api"           : 37846,
    "location"      : "",
    "warning"       : "",
    "wiki_url"      : "",
    "tracker_url"   : "",
    "category"      : "Game Engine"}

import sys

lc_path = __path__[0]
embed_path = [lc_path  + '/embed', lc_path + '/embed/content']

for p in embed_path:
    if not p in sys.path:
        sys.path.append(p)

if "bpy" in locals():
    import imp
    imp.reload(lcserver)
else:
    from lambdacube import lcserver

import bpy
import sys
from bpy.props import FloatVectorProperty
from mathutils import Vector

#### REGISTER ####

def register():
    print('Start LambdaCube server.')
    lcserver.startServer()

def unregister():
    print('Stop LambdaCube server.')
    lcserver.stopServer()

if __name__ == '__main__':
    register()
