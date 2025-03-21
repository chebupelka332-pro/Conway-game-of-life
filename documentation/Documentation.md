## Project Description

Our project implements the "Game of Life", conceived by John Conway, using CdM-16, Logisim, and cdm-devkit.

Our project includes:
- A keyboard for receiving user commands;
- A terminal for displaying commands and errors to the user;
- A CdM-16 processor for processing user commands;
- A video buffer for calculating the current state of the field;
- A display for showing the game field.

---
## Key Features

Our version of the game has several distinctive features:

- Looped (toroidal) field;
- Customizable game rules (birth and survival);
- The ability to modify the field at any time;
- Implementation of user interaction through a keyboard and terminal using commands.

---
## Command List and Their Description

1. `set <x> <y> <val>` - set the value of cell (x, y);
2. `rule <born> <sur>` - set game rules: birth and survival;
3. `stop` - stop the game;
4. `start` - start the game;
5. `fill <x1> <y1> <x2> <y2> <val>` - fill the rectangle ((x1, y1), (x2 - 1, y2 - 1)) with the value `<val>`;
6. `clean` - clear the entire field;
7. `help` - display documentation;
8. `set-glider <x> <y>` - draw a working glider at coordinates (x, y).

---

## Examples of Command Usage

1. `set 2 3 1` — fill the cell with coordinates (2, 3);
2. `fill 12 23 23 34 1 start` — fill the rectangle with starting vertex at (12, 23) and ending vertex at (22, 33), then start the game;
3. `fill 0 0 2 6 1 fill 3 0 2 9 1 fill 3 7 9 9 1 fill 0 7 6 9 1 start` — create a "Coca Galaxy" and start the game;
4. `rule 1 1` — standard "Game of Life" rules.
