# 4-Directional Animation

## Getting Started
### Requirement
* Godot Engine v3.2+

### Installation
After downloading, open Godot Engine Project Manager. Click Import, go to the folder you've downloaded into, and select "project.godot".

## Usage
### Opening the Project
The scene contains a red square. It can walk around and boogie on the spot!

### Controls
Arrow keys to move, Space to dance.

### Applicability
The script `dir_sprite.gd` can be attached to the Sprite node. With it, you can set the side and action frame parameters seperately for animation.

If you want to move `dir_sprite.gd` to your project, be sure to move `dir_sprite.svg` into the same folder too. Otherwise, you need to change or remove the path to its icon at `dir_sprite.gd`'s line 4.

You may edit the enum on `dir_sprite.gd`'s line 6 if you plan for a different set of directions.

### See Also
The [wiki](https://github.com/mechPenSketch/4-dir_Anim/wiki), for more info on how it works and how to use it.

## Author
* mechPenSketch

## License
This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
